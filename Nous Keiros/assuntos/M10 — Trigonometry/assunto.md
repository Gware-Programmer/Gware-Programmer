# M10 — Trigonometry

*Trigonometria*

- **Trilha:** Mathematics
- **Nível:** 2 — O motor · onda 1
- **Termos:** trigonometry, unit circle, radians
- **Projetos KEIROS:** REIXU

## Por que importa

Seno e cosseno descrevem tudo que oscila ou gira: ritmos cerebrais (teta, gama), sinais de EEG, a análise de Fourier e as codificações posicionais rotativas (RoPE) dos transformers. São também o núcleo da similaridade de cosseno entre vetores.

## Pré-requisitos

- **Depende de:** M08 (Functions and graphs)
- **Destrava:** M11 (Complex numbers and Euler's formula), M14 (Single-variable differential calculus), M16 (Vectors and geometry in ℝⁿ)

## Base

1. Triângulo retângulo: seno, cosseno e tangente; teorema de Pitágoras.
2. Radianos como comprimento de arco no círculo unitário, e por que são a unidade natural.
3. Círculo unitário: seno e cosseno de qualquer ângulo; sinais por quadrante.
4. sen²θ + cos²θ = 1 e os ângulos notáveis.
5. Funções trigonométricas como funções periódicas: período, amplitude e fase.
6. Fórmulas de adição e de arco duplo.
7. Lei dos senos e lei dos cossenos.

## Meio

- Coordenadas polares; girar um ponto do plano por um ângulo θ.
- Funções inversas (arcsen, arccos, arctan) e atan2 — e por que atan2 existe.
- Somas de senoides, batimento, sinais compostos.

## Avançado

- Rotação como multiplicação por e^{iθ} → M11 e como matriz 2×2 → M17; a RoPE codifica posição girando pares de coordenadas → L13.
- Senos e cossenos como base para representar qualquer sinal periódico (séries de Fourier) → M31.
- Similaridade de cosseno entre embeddings: cos θ = ⟨u, v⟩/(|u||v|) → M16.

## Matemática necessária

**M08**: funções, periodicidade e gráficos.

## Métodos

- Derive as fórmulas de adição geometricamente em vez de decorá-las.
- Gere e ouça sinais: some senoides em Python, salve como áudio e escute o batimento.
- Implemente a rotação 2D e verifique numericamente que ela preserva distâncias.

## Desafios

- Graus vs. radianos: as bibliotecas usam radianos — erro clássico em código.
- Decorar tabelas sem o círculo unitário.
- sen⁻¹x é arcsen x, não 1/sen x.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Círculo trigonométrico](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=29) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Funções trigonométricas](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=42) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Trigonometria: fórmulas de adição e duplicação de arcos](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=1014) — IMPA/OBMEP · curso
- 📖 [Trigonometry](https://doi.org/10.1007/978-1-4612-0149-6) — I. M. Gelfand & Mark Saul, 2001 · livro. trigonometria pensada, não decorada
- 📖 [Algebra and Trigonometry 2e](https://openstax.org/details/books/algebra-and-trigonometry-2e) — Jay Abramson et al. (OpenStax), 2021 · livro

## Boss fight

Implemente seno e cosseno do zero em C ou REIXU: reduza o argumento a [−π/4, π/4] usando identidades e avalie um polinômio aproximador dado; meça o erro máximo contra a libm em um milhão de pontos. Depois gere um sinal sintético "tipo EEG" (ondas de 6 Hz e 40 Hz somadas a ruído) e descubra frequência e amplitude de cada componente por busca em grade (grid search) sobre senoides candidatas.

## Checkpoint

- [ ] Converta 135° para radianos e dê seno e cosseno exatos sem calculadora.
- [ ] Deduza cos(2θ) a partir da fórmula de adição.
- [ ] Por que atan2(y, x) é necessário em vez de arctan(y/x)?
- [ ] Gire o ponto (1, 0) por 60° e escreva as coordenadas exatas.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
