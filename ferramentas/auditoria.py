"""Gera os relatórios de alinhamento da auditoria a partir de mapa/mapa.json.

Uso:  python3 ferramentas/auditoria.py ["caminho/para/Nous Keiros"]
Saída: auditoria/alinhamento.csv e um resumo no terminal.
"""
import collections
import csv
import json
import os
import sys

RAIZ = sys.argv[1] if len(sys.argv) > 1 else os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), 'Nous Keiros')
D = json.load(open(os.path.join(RAIZ, 'mapa', 'mapa.json'), encoding='utf-8'))
S = D['subjects']
TRILHA = {t['id']: t['name'] for t in D['tracks']}
PAPEL = {'M': 'fundamento', 'P': 'fundamento', 'C': 'componente', 'L': 'componente', 'I': 'componente',
         'R': 'componente', 'A': 'componente', 'K': 'componente', 'AL': 'componente', 'G': 'contexto',
         'N': 'contexto', 'S': 'contexto', 'B': 'contexto', 'F': 'contexto', 'X': 'contexto', 'Z': 'prática'}
COMPETENCIA = {'M': 'matemática', 'C': 'programação e sistemas', 'L': 'ML, deep learning e pipeline de LLM',
               'R': 'aprendizado por reforço', 'A': 'agentes', 'I': 'interpretabilidade', 'AL': 'segurança e alinhamento',
               'K': 'cognição, neurociência e consciência (Rei Ichi)', 'G': 'cognição, neurociência e consciência (Rei Ichi)',
               'N': 'cognição, neurociência e consciência (Rei Ichi)', 'S': 'cognição, neurociência e consciência (Rei Ichi)',
               'B': 'cognição, neurociência e consciência (Rei Ichi)', 'F': 'cognição, neurociência e consciência (Rei Ichi)',
               'X': 'cognição, neurociência e consciência (Rei Ichi)', 'P': 'ofício de pesquisador', 'Z': 'pipeline completo (prática)'}
anc = {}
def ancestrais(i):
    if i not in anc:
        r = set()
        for d in S[i]['deps']:
            r.add(d); r |= ancestrais(d)
        anc[i] = r
    return anc[i]
caminho = set()
for i in S:
    if S[i]['tr'] == 'Z':
        caminho |= ancestrais(i) | {i}
linhas = []
for i in D['order']:
    s = S[i]
    papel = PAPEL[s['tr']]
    if i not in caminho and papel == 'componente':
        papel = 'aprofundamento'
    linhas.append({'id': i, 'titulo': s['t'], 'trilha': TRILHA[s['tr']], 'nivel': s['lv'], 'onda': s['w'],
                   'papel': papel, 'competencia': COMPETENCIA[s['tr']],
                   'caminho_direto': 'sim' if i in caminho else 'não',
                   'nao_serve_ao_objetivo': ''})
os.makedirs(os.path.join(RAIZ, 'auditoria'), exist_ok=True)
with open(os.path.join(RAIZ, 'auditoria', 'alinhamento.csv'), 'w', newline='', encoding='utf-8') as f:
    w = csv.DictWriter(f, fieldnames=list(linhas[0]))
    w.writeheader(); w.writerows(linhas)
print('assuntos:', len(linhas))
print('no caminho direto até os projetos:', sum(1 for l in linhas if l['caminho_direto'] == 'sim'))
print('papéis:', dict(collections.Counter(l['papel'] for l in linhas)))
print('fora do caminho direto por trilha:', dict(collections.Counter(l['trilha'] for l in linhas if l['caminho_direto'] == 'não')))
