"""Gera a pasta Nous Keiros a partir de mapa/mapa.json.

Uso:  python3 ferramentas/gerar.py ["caminho/para/Nous Keiros"]

Escreve só os arquivos gerados (assunto.md de cada assunto e mapa/fontes.bib).
Nunca apaga nem altera outros arquivos que você ou o app criarem nas pastas.
Se o título de um assunto mudar, a pasta é renomeada e o conteúdo dela é mantido.
"""
import json
import os
import re
import sys
import unicodedata

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from html_md import html_md  # noqa: E402

RAIZ = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'Nous Keiros')
PROIBIDOS = re.compile(r'[\\/:*?"<>|\x00-\x1f]')


def nome_pasta(sid, titulo):
    t = titulo.replace(': ', ', ').replace(':', ',')
    t = PROIBIDOS.sub('', t).strip().rstrip('.')
    t = re.sub(r'\s+', ' ', t)
    nome = f'{sid} — {t}'
    return nome[:120].rstrip(' .,')


def pasta_do_assunto(base, sid, titulo):
    alvo = os.path.join(base, nome_pasta(sid, titulo))
    existentes = [d for d in os.listdir(base) if d == sid or d.startswith(sid + ' — ')] if os.path.isdir(base) else []
    for d in existentes:
        atual = os.path.join(base, d)
        if atual != alvo and not os.path.exists(alvo):
            os.rename(atual, alvo)
    os.makedirs(alvo, exist_ok=True)
    return alvo


def gravar(caminho, texto):
    tmp = caminho + '.tmp'
    with open(tmp, 'w', encoding='utf-8') as f:
        f.write(texto)
        f.flush()
        os.fsync(f.fileno())
    os.replace(tmp, caminho)


def lista_ids(ids, S):
    return ', '.join(f'{i} ({S[i]["t"]})' for i in ids) if ids else '—'


def assunto_md(sid, s, D, S):
    trilha = next(t['name'] for t in D['tracks'] if t['id'] == s['tr'])
    nivel = D['levels'][s['lv']]['name']
    md = [f'# {sid} — {s["t"]}', '']
    if s.get('t_pt'):
        md += [f'*{s["t_pt"]}*', '']
    md += [f'- **Trilha:** {trilha}', f'- **Nível:** {s["lv"]} — {nivel} · onda {s["w"]}', f'- **Termos:** {s["en"]}']
    if s.get('kei'):
        md.append(f'- **Projetos KEIROS:** {", ".join(s["kei"])}')
    md += ['', '## Por que importa', '', html_md(s['why']), '',
           '## Pré-requisitos', '', f'- **Depende de:** {lista_ids(s["deps"], S)}', f'- **Destrava:** {lista_ids(s["unl"], S)}']
    if s.get('pre'):
        md += ['', html_md(s['pre'])]
    for titulo, campo in [('Base', 'base'), ('Meio', 'mid'), ('Avançado', 'adv'), ('Matemática necessária', 'math'),
                          ('Métodos', 'how'), ('Desafios', 'hard')]:
        md += ['', f'## {titulo}', '', html_md(s[campo])]
    md += ['', '## Fontes', '']
    for x in s['src']:
        linha = f'- {x["ic"]} [{x["ti"]}]({x["u"]}) — {x["au"]} · {x["ty"]}'
        if x.get('n'):
            linha += f'. {html_md(x["n"])}'
        if not x.get('ok', True):
            linha += f' ⚠ não verificado — {x.get("why", "")}'
        md.append(linha)
    md += ['', '## Boss fight', '', html_md(s['boss']), '', '## Checkpoint', '']
    md += [f'- [ ] {html_md(c)}' for c in s['check']]
    md += ['', '---', '', 'Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.',
           'Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.', '']
    return '\n'.join(md)


def chave_bib(x, usadas):
    au = re.split(r',|&| and ', x['au'])[0].strip()
    sob = (au.split()[-1] if au else 'anon')
    sob = unicodedata.normalize('NFKD', sob).encode('ascii', 'ignore').decode()
    ano = (re.findall(r'\b(?:19|20)\d\d\b', x['au']) or [''])[-1]
    pal = (re.findall(r'[A-Za-z]{3,}', unicodedata.normalize('NFKD', x['ti']).encode('ascii', 'ignore').decode()) or ['x'])[0]
    base = re.sub(r'[^A-Za-z0-9]', '', f'{sob}{ano}{pal}').lower() or 'fonte'
    k, n = base, 2
    while k in usadas:
        k = f'{base}{n}'; n += 1
    usadas.add(k)
    return k


def bib_esc(t):
    return t.replace('\\', '\\\\').replace('{', '\\{').replace('}', '\\}').replace('&', '\\&').replace('%', '\\%').replace('#', '\\#')


def fontes_bib(D):
    usadas, out = set(), []
    for x in D['sources']:
        k = chave_bib(x, usadas)
        au = re.sub(r',\s*(?:19|20)\d\d\s*$', '', x['au']).strip()
        au = au.replace(' & ', ' and ').replace(' et al.', ' and others')
        au = re.sub(r',\s*(?=[^,]+$)', ' and ', au) if ' and ' not in au and au.count(',') == 1 else au
        ano = (re.findall(r'\b(?:19|20)\d\d\b', x['au']) or [''])[-1]
        campos = [f'  title = {{{bib_esc(x["ti"])}}}', f'  author = {{{bib_esc(au)}}}']
        if ano:
            campos.append(f'  year = {{{ano}}}')
        campos.append(f'  howpublished = {{\\url{{{x["u"]}}}}}')
        nota = f'{x["ty"]}; assuntos: {", ".join(x.get("in", []))}'
        if not x.get('ok', True):
            nota += f'; não verificado: {x.get("why", "")}'
        campos.append(f'  note = {{{bib_esc(nota)}}}')
        out.append('@misc{' + k + ',\n' + ',\n'.join(campos) + '\n}\n')
    return '\n'.join(out)


def main():
    D = json.load(open(os.path.join(RAIZ, 'mapa', 'mapa.json'), encoding='utf-8'))
    S = D['subjects']
    base = os.path.join(RAIZ, 'assuntos')
    os.makedirs(base, exist_ok=True)
    for sid in D['order']:
        p = pasta_do_assunto(base, sid, S[sid]['t'])
        gravar(os.path.join(p, 'assunto.md'), assunto_md(sid, S[sid], D, S))
    gravar(os.path.join(RAIZ, 'mapa', 'fontes.bib'), fontes_bib(D))
    print(f'{len(S)} assuntos gerados em {base}; {len(D["sources"])} fontes em mapa/fontes.bib')


if __name__ == '__main__':
    main()
