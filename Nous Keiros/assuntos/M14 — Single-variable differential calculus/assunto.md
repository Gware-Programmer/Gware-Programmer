# M14 — Single-variable differential calculus

*Cálculo diferencial de uma variável*

- **Trilha:** Mathematics
- **Nível:** 3 — Cálculo e incerteza · onda 1
- **Termos:** differential calculus, derivative, chain rule
- **Projetos KEIROS:** REIXU

## Por que importa

A derivada é o conceito mais importante para treinar redes: o gradiente é uma coleção de derivadas, e a regra da cadeia é, literalmente, o algoritmo de backpropagation. Sem derivadas, "aprender" não tem mecanismo.

## Pré-requisitos

- **Depende de:** M10 (Trigonometry), M12 (Sequences, series and summations)
- **Destrava:** M15 (Integral calculus and Taylor series), C03 (Scalar automatic differentiation from scratch), L01 (Foundations of supervised learning)

## Base

1. Limite de uma função (intuição) e continuidade.
2. Derivada como taxa instantânea de variação e inclinação da reta tangente; definição pelo limite do quociente de diferenças.
3. Regras: linearidade, produto, quociente, potência.
4. Regra da cadeia (chain rule) — a regra que mais importa para IA.
5. Derivadas de exp, ln, sen e cos; derivação implícita.
6. Crescimento, máximos e mínimos, concavidade, teste da segunda derivada.
7. Aproximação linear: f(x + h) ≈ f(x) + f′(x)·h.

## Meio

- Otimização em uma variável: f′(x) = 0; método de Newton para achar raízes.
- Teorema do valor médio; regra de L'Hôpital.
- Derivadas das funções de ativação: σ′ = σ(1 − σ) para a sigmoide, tanh′ = 1 − tanh², e a ReLU, que não é derivável em 0 (subgradiente).
- Diferenças finitas como derivada numérica, e o erro que elas cometem.

## Avançado

- Gradiente descendente em 1D (x ← x − η·f′(x)) e por que um passo η grande demais diverge → M27.
- Diferenciação simbólica vs. numérica vs. automática: o que cada uma calcula e quanto custa → C03.
- Funções não suaves e subgradientes; derivadas fracas — onde a ReLU vive formalmente → M33.

## Matemática necessária

**M12**: limites de sequências; **M10**: trigonometria; **M09**: exponenciais e logaritmos; **M08**: funções.

## Métodos

- Derive à mão dezenas de funções compostas até a regra da cadeia ficar automática.
- Confira cada derivada com diferenças finitas em código (gradient checking): é o hábito que pega bugs silenciosos em todo o resto do mapa.
- Primeiro a intuição (3Blue1Brown), depois exercícios em volume (MIT 18.01SC, OpenStax).

## Desafios

- Esquecer a derivada da função de dentro na regra da cadeia.
- Achar que f′(x) = 0 garante mínimo: pode ser máximo ou ponto de inflexão.
- Tratar limite como "substituir o valor" — só funciona para funções contínuas.
- Diferenças finitas com h minúsculo: o erro de arredondamento domina → M32.

## Fontes

- 🎬 [Essence of Calculus](https://www.3blue1brown.com/topics/calculus) — Grant Sanderson (3Blue1Brown) · video. intuição geométrica antes do formalismo
- 🎓 [Single Variable Calculus (18.01SC)](https://ocw.mit.edu/courses/18-01sc-single-variable-calculus-fall-2010/) — MIT OpenCourseWare · curso. exercícios e provas resolvidas
- 🎓 [Portal da Matemática OBMEP — Introdução ao Cálculo: definição de derivada](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=269) — IMPA/OBMEP · curso. em português; siga também o módulo da regra da cadeia
- 🎓 [Portal da Matemática OBMEP — Regra da cadeia](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=990) — IMPA/OBMEP · curso
- 📖 [Calculus Volume 1](https://openstax.org/details/books/calculus-volume-1) — Gilbert Strang & Edwin Herman (OpenStax), 2016 · livro. caps. 2–4
- 📖 [Calculus Made Easy](https://www.gutenberg.org/ebooks/33283) — Silvanus P. Thompson, 1910 · livro. clássico em domínio público para perder o medo

## Boss fight

Escreva um diferenciador simbólico (em REIXU ou Python) para expressões com +, −, ×, ÷, potência, exp, ln, sen, cos e composição, com simplificação do resultado. Valide cada derivada contra diferenças finitas em mil pontos aleatórios. Depois use-o para minimizar f(x) = x⁴ − 3x³ + 2 por gradiente descendente e por Newton, plotando as trajetórias e o que acontece quando o passo é grande demais.

## Checkpoint

- [ ] Derive f(x) = ln(1 + e^(−3x²)).
- [ ] Mostre que σ′(x) = σ(x)(1 − σ(x)) para σ(x) = 1/(1 + e^(−x)).
- [ ] Dê três funções com f′(0) = 0: uma com mínimo, uma com máximo e uma com nenhum dos dois em 0.
- [ ] Qual a aproximação linear de √x em x = 4, e quanto ela erra em x = 4,1?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
