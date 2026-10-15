"""Valida o conteúdo do mapa (Nous Keiros/mapa/mapa.json).

Uso:  python3 ferramentas/validar.py ["caminho/para/Nous Keiros"] [--progresso export.json]

Erros (o mapa não pode ser usado assim) fazem o script sair com código 1.
Avisos (regra de materiais) só são listados.
"""
import json
import os
import re
import sys

PROG = sys.argv[sys.argv.index('--progresso') + 1] if '--progresso' in sys.argv else None
args = [a for a in sys.argv[1:] if not a.startswith('--') and a != PROG]
RAIZ = args[0] if args else os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'Nous Keiros')

D = json.load(open(os.path.join(RAIZ, 'mapa', 'mapa.json'), encoding='utf-8'))
S = D['subjects']
erros, avisos = [], []
BLOCOS = ['why', 'base', 'mid', 'adv', 'math', 'how', 'hard', 'boss']
JAPONES = re.compile(r'[　-〿぀-ヿ㐀-䶿一-鿿＀-￯]')
REF = re.compile(r'class="ref ?([a-z]*)" data-id="([A-Z]+\d+)"')

# 1. grafo: dependências existem, sem ciclo, destravas = arestas reversas
for i, s in S.items():
    for d in s['deps']:
        if d not in S:
            erros.append(f'{i}: dependência inexistente {d}')
anc, estado = {}, {}
def ancestrais(i, pilha=()):
    if i in pilha:
        erros.append('ciclo: ' + ' → '.join(pilha + (i,)))
        return set()
    if i in anc:
        return anc[i]
    r = set()
    for d in S[i]['deps']:
        if d in S:
            r.add(d); r |= ancestrais(d, pilha + (i,))
    anc[i] = r
    return r
for i in S:
    ancestrais(i)
for i, s in S.items():
    esperado = sorted(u for u in S if i in S[u]['deps'])
    if sorted(s['unl']) != esperado:
        erros.append(f'{i}: "destrava" não bate com as dependências ({s["unl"]} vs {esperado})')

# 2. níveis e ondas: toda dependência vem antes (nível, onda); portão de nível
for i, s in S.items():
    for d in s['deps']:
        if d in S and (S[d]['lv'], S[d]['w']) >= (s['lv'], s['w']):
            erros.append(f'{d} → {i}: dependência não vem antes (nível/onda)')
cols = [tuple(c) for c in D['cols']]
for i, s in S.items():
    if not (0 <= s['x'] < len(cols)) or cols[s['x']] != (s['lv'], s['w']):
        erros.append(f'{i}: coluna x não corresponde a (nível, onda)')
for lv in D['levels']:
    for k, onda in enumerate(lv['waves']):
        for i in onda:
            if (S[i]['lv'], S[i]['w']) != (lv['n'], k + 1):
                erros.append(f'nível {lv["n"]}: {i} fora da onda certa')
if not D['meta'].get('regras', {}).get('portao_de_nivel'):
    erros.append('meta.regras.portao_de_nivel ausente')

# 3. blocos completos e referências válidas
for i, s in S.items():
    for b in BLOCOS:
        if not (s.get(b) or '').strip():
            erros.append(f'{i}: bloco vazio "{b}"')
    if len(s['src']) < 3:
        erros.append(f'{i}: menos de 3 fontes')
    if len(s['check']) < 3:
        erros.append(f'{i}: menos de 3 itens de checkpoint')
    for b in BLOCOS + ['pre']:
        for tipo, rid in REF.findall(s.get(b) or ''):
            if rid not in S:
                erros.append(f'{i}.{b}: referência a assunto inexistente {rid}')
            elif tipo == 'req' and rid not in anc[i]:
                erros.append(f'{i}.{b}: pré-requisito {rid} citado no texto não está na árvore de dependências')

# 4. sem japonês nos campos de interface
for t in D['tracks']:
    if JAPONES.search(t['name']):
        erros.append(f'trilha {t["id"]}: japonês no nome')
for lv in D['levels']:
    for k in ('name', 'mission', 'boss', 'now', 'note'):
        if JAPONES.search(lv.get(k) or ''):
            erros.append(f'nível {lv["n"]}: japonês em {k}')
for i, s in S.items():
    if JAPONES.search(s['t']):
        erros.append(f'{i}: japonês no título')

# 5. compatibilidade com o progresso antigo
base_ids = os.path.join(RAIZ, 'auditoria', 'ids_originais.json')
if os.path.exists(base_ids):
    orig = json.load(open(base_ids, encoding='utf-8'))
    for i, n in orig.items():
        if i not in S:
            erros.append(f'ID original removido: {i}')
        elif len(S[i]['check']) != n:
            erros.append(f'{i}: número de itens do checkpoint mudou ({n} → {len(S[i]["check"])}), o progresso antigo desalinha')
if PROG:
    P = json.load(open(PROG, encoding='utf-8'))
    p = P.get('progress', P)
    for i, x in p.get('s', {}).items():
        if i not in S:
            erros.append(f'progresso: assunto {i} não existe mais')
        elif len(x.get('c', [])) > len(S[i]['check']):
            erros.append(f'progresso: {i} tem mais itens marcados do que o checkpoint atual')

# 6. fontes globais ligadas
por_url = {x['u']: x for x in D['sources']}
for i, s in S.items():
    for x in s['src']:
        g = por_url.get(x['u'])
        if g is None or i not in g.get('in', []):
            erros.append(f'{i}: fonte fora da lista global ({x["ti"][:50]})')

# 7. regra de materiais (avisos)
ENTRADA = {'curso', 'guia', 'video', 'site', 'artigo'}
CANONICO = {'livro', 'review', 'paper'}
PRATICO = {'ferramenta', 'curso', 'guia', 'dados'}
AULA = {'curso', 'video'}
CRITERIOS = ('entrada', 'texto canônico', 'prático', 'aula/vídeo', 'fonte 2025–2026')
def ano(x):
    anos = [int(a) for a in re.findall(r'\b(?:19|20)\d\d\b', x['au'])]
    return max(anos) if anos else 0
for i, s in S.items():
    tipos = {x['ty'] for x in s['src']}
    falta = []
    if not tipos & ENTRADA: falta.append('entrada')
    if not tipos & CANONICO: falta.append('texto canônico')
    if not tipos & PRATICO: falta.append('prático')
    if not tipos & AULA: falta.append('aula/vídeo')
    if s['lv'] >= 8 and s['tr'] != 'M' and not any(x['ty'] == 'recente' or ano(x) >= 2025 for x in s['src']):
        falta.append('fonte 2025–2026')
    exc = s.get('excecoes', {})
    for k, motivo in exc.items():
        if k not in CRITERIOS or not motivo.strip():
            erros.append(f'{i}: exceção inválida ({k!r})')
        elif k not in falta:
            avisos.append(f'{i}: exceção desnecessária ({k}), o critério já é cumprido')
    falta = [k for k in falta if k not in exc]
    if falta:
        avisos.append(f'{i}: falta {", ".join(falta)}')

print(f'{len(S)} assuntos · {len(D["sources"])} fontes · {len(D["levels"])} níveis · {len(D["tracks"])} trilhas')
print(f'{sum(1 for s in S.values() if s.get("excecoes"))} assuntos com exceção justificada na regra de materiais')
for a in avisos:
    print('aviso:', a)
for e in erros:
    print('ERRO:', e)
print(f'{len(erros)} erros, {len(avisos)} avisos')
sys.exit(1 if erros else 0)
