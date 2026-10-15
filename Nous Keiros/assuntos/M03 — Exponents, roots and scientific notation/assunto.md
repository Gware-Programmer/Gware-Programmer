# M03 — Exponents, roots and scientific notation

*Potências, raízes e notação científica*

- **Trilha:** Mathematics
- **Nível:** 0 — Fundamentos · onda 3
- **Termos:** exponents, roots, scientific notation

## Por que importa

Escala é a língua da IA: modelos com 10¹¹ parâmetros, treinos com 10²⁵ operações de ponto flutuante, leis de escala em forma de lei de potência. Potências e notação científica são o vocabulário para raciocinar por ordem de grandeza — os "números antes das conclusões".

## Pré-requisitos

- **Depende de:** M02 (Fractions, decimals, ratio, proportion and percentage)
- **Destrava:** M04 (Elementary algebra: expressions, equations and inequalities)

## Base

1. Potência com expoente natural como multiplicação repetida; base e expoente.
2. Regras: aᵐ·aⁿ = aᵐ⁺ⁿ, (aᵐ)ⁿ = aᵐⁿ, (ab)ⁿ = aⁿbⁿ, e por que a⁰ = 1.
3. Expoentes negativos (a⁻ⁿ = 1/aⁿ) e fracionários (a^(1/n) é a raiz n-ésima).
4. Raízes quadradas e cúbicas; simplificação de radicais; racionalização de denominadores.
5. Notação científica e ordem de grandeza; prefixos do SI (kilo, mega, giga, tera, peta, exa).
6. Potências de 2: 2¹⁰ ≈ 10³; bits, bytes e quantos valores cabem em n bits; prefixos binários (KiB, MiB, GiB).

## Meio

- Estimativas de Fermi (Fermi estimation): um modelo de 8 bilhões de parâmetros em bf16 (2 bytes cada) ocupa cerca de 16 GB só de pesos — cabe nos 24 GB da sua RTX 3090? E no M1?
- Lei de potência (power law) y = c·xᵏ: dobrar x multiplica y por 2ᵏ.
- Crescimento polinomial vs. exponencial (x² vs. 2ˣ) em tabelas, para criar intuição numérica.

## Avançado

- Leis de escala de LLMs são leis de potência da perda em função de parâmetros, dados e computação → L16; vão aparecer como retas em gráficos log-log → M09.
- Notação assintótica: atenção custa O(n²) no tamanho do contexto → L13.
- Em hardware, o expoente do ponto flutuante é a "notação científica em base 2" → M32.

## Matemática necessária

**M02**: frações (expoentes negativos e fracionários são frações de potências).

## Métodos

- Mantenha uma "tabela de constantes da IA" com ordens de grandeza (parâmetros, tokens de treino, memória de GPUs, consumo de energia) e atualize-a a cada paper lido.
- Estimativa de Fermi como hábito: chute → calcule → compare com a fonte.
- Derive cada regra escrevendo os fatores um a um, em vez de decorar.

## Desafios

- (a + b)² ≠ a² + b²: potência não distribui sobre soma.
- √(a + b) ≠ √a + √b.
- GB (10⁹) vs. GiB (2³⁰): diferença de ~7% que vira erro de memória em GPU.
- Raiz quadrada de negativo não existe nos reais; a solução vem com os complexos → M11.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Potenciação](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=1059) — IMPA/OBMEP · curso
- 📖 [Algebra](https://doi.org/10.1007/978-1-4612-0335-3) — I. M. Gelfand & A. Shen, 2004 · livro. problemas que obrigam a entender, não a decorar
- 📖 [Elementary Algebra 2e](https://openstax.org/details/books/elementary-algebra-2e) — Marecek, Anthony-Smith & Mathis (OpenStax), 2020 · livro. cap. 6 (polinômios e expoentes)
- 🗺️ [How To Scale Your Model](https://jax-ml.github.io/scaling-book/) — Austin et al. (Google DeepMind), 2025 · guia. só os números e ordens de grandeza por enquanto; volte a ele em computação

## Boss fight

Escreva uma "calculadora de Fermi para IA": dado o número de parâmetros, a precisão (fp32, bf16, int8, int4) e o tamanho do contexto, ela estima a memória dos pesos e a ordem de grandeza de operações por token (≈ 2 × parâmetros por token gerado). Use-a para decidir, com números, quais modelos abertos cabem no seu M1 e na RTX 3090, e registre onde a estimativa erra quando comparada com a realidade.

## Checkpoint

- [ ] Simplifique (2⁵·2⁻³)² / 2⁴ sem calculadora.
- [ ] Por que a⁰ = 1? Dê o argumento, não a regra.
- [ ] Quantos bytes ocupam 7×10⁹ parâmetros em bf16? E em int4?
- [ ] Escreva 0,000042 em notação científica e diga a ordem de grandeza.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
