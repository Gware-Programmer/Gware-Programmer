# M09 — Exponentials and logarithms

*Exponenciais e logaritmos*

- **Trilha:** Mathematics
- **Nível:** 2 — O motor · onda 1
- **Termos:** exponential, logarithm, log scale

## Por que importa

O logaritmo está em toda parte na IA: log-verossimilhança (log-likelihood), entropia cruzada, softmax, perplexidade, gráficos log-log das leis de escala e a lei de Weber-Fechner da percepção. Exponenciais modelam crescimento, decaimento e o "tempo de duplicação" de capacidades.

## Pré-requisitos

- **Depende de:** M08 (Functions and graphs)
- **Destrava:** M11 (Complex numbers and Euler's formula), M12 (Sequences, series and summations), G03 (Human memory)

## Base

1. Função exponencial aˣ (a > 0): gráfico, crescimento e decaimento.
2. O número e como limite de juros compostos: (1 + 1/n)ⁿ → e.
3. Logaritmo como inversa da exponencial: log_a(x) = y ⇔ aʸ = x.
4. Propriedades: log(xy) = log x + log y, log(xᵏ) = k·log x, mudança de base.
5. ln (base e), log₂ (bits), log₁₀ (ordens de grandeza).
6. Equações exponenciais e logarítmicas.
7. Escalas logarítmicas; gráficos semi-log e log-log: retas em log-log ⇔ leis de potência **M03**.

## Meio

- Meia-vida e tempo de duplicação; crescimento logístico (curva em S, sigmoide) vs. exponencial puro.
- O truque log-sum-exp: subtrair o máximo antes de exponenciar para não estourar a precisão.
- Softmax: exponenciais transformam pontuações em probabilidades; o papel da temperatura.
- Por que se somam log-probabilidades em vez de multiplicar probabilidades (underflow).

## Avançado

- Sigmoide e tanh como funções de ativação, e sua relação com a função logística → L08.
- Entropia H = −Σ p log p e por que o log é a medida natural de informação (aditividade para eventos independentes) → M26.
- Leis de escala como retas em log-log → L16 e tendências exponenciais em capacidades de agentes — e o perigo de extrapolar exponenciais ruidosas → A07.

## Matemática necessária

**M08**: funções, inversas e gráficos.

## Métodos

- Implemente exp e ln sem bibliotecas: exp pelo limite de juros compostos e ln por busca binária sobre exp; compare com a libm.
- Plote os mesmos dados em escala linear, semi-log e log-log e descreva o que cada uma revela.
- Implemente log-sum-exp ingênuo e estável e encontre as entradas que quebram o ingênuo.

## Desafios

- log(a + b) ≠ log a + log b.
- "Exponencial" não significa "rápido": significa taxa relativa constante.
- Extrapolar exponenciais ajustadas a poucos pontos ruidosos é a armadilha nº 1 das previsões sobre IA.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Função exponencial](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=94) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Função logarítmica](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=96) — IMPA/OBMEP · curso
- 📖 [College Algebra 2e](https://openstax.org/details/books/college-algebra-2e) — Jay Abramson et al. (OpenStax), 2021 · livro. cap. 6
- 📖 [Calculus Volume 1](https://openstax.org/details/books/calculus-volume-1) — Gilbert Strang & Edwin Herman (OpenStax), 2016 · livro. §1.5, funções exponenciais e logarítmicas

## Boss fight

Implemente em C ou Python puro softmax e log-sum-exp numericamente estáveis, com testes de estresse (entradas na casa de ±1000), e demonstre num experimento por que multiplicar 10 mil probabilidades dá zero enquanto somar log-probabilidades funciona. Bônus: ajuste uma reta em log-log a uma série de tamanhos de modelos ao longo do tempo, reporte o expoente e escreva por que você não confiaria na extrapolação.

## Checkpoint

- [ ] Resolva 3^(2x − 1) = 27 e log₂(x) + log₂(x − 2) = 3.
- [ ] Por que uma lei de potência vira uma reta em log-log, e qual é a inclinação?
- [ ] Mostre que log Σ exp(xᵢ) = m + log Σ exp(xᵢ − m) com m = max xᵢ, e por que isso evita overflow.
- [ ] Se algo dobra a cada período T, quantos períodos leva para crescer 1000 vezes?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
