# S04 — Integrated information theory (IIT): versions and computing Φ

*Teoria da informação integrada (IIT): versões e cálculo de Φ*

- **Trilha:** Consciousness
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** integrated information theory, IIT 4.0, phi, cause-effect structure, PyPhi
- **Projetos KEIROS:** Rei Ichi

## Por que importa

A teoria da informação integrada (integrated information theory, IIT) é a única grande teoria que parte da experiência (axiomas) e deriva uma medida matemática, Φ, de quanto e de que tipo é a consciência de um sistema físico. É também a mais contestada. Entender os axiomas, o cálculo de Φ — e por que um "Φ" calculado no seu software não é o Φ da IIT — é obrigatório para o Rei Ichi.

## Pré-requisitos

- **Depende de:** S02 (The science of consciousness: methods and measures), C02 (NumPy: vectorization, broadcasting and memory layout), M26 (Information theory), M30 (Graph theory and networks)
- **Destrava:** S09 (Adversarial collaborations and the empirical state of the field)

## Base

1. A estratégia: da fenomenologia ao mecanismo. Na IIT 4.0, o axioma zero (a experiência existe) e cinco axiomas: intrinsecalidade, informação, integração, exclusão e composição.
2. Postulados: cada axioma traduzido em exigência sobre o poder de causa e efeito de um substrato físico.
3. O substrato modelado como elementos com estados e uma matriz de probabilidades de transição (TPM) **C02**, **M30**.
4. Repertórios de causa e de efeito, a partição mínima (MIP), φ de mecanismos e Φ do sistema **M26**.
5. O complexo (o subconjunto com Φ máximo) e a estrutura de causa e efeito, que a teoria identifica com a qualidade da experiência.
6. Versões 1.0 (2004), 3.0 (2014) e 4.0 (2023): a matemática muda de uma para outra.

## Meio

- Custo: o número de partições e subconjuntos explode; o cálculo exato só cabe em sistemas da ordem de uma dezena de elementos binários **M13**.
- PyPhi, a implementação de referência.
- Função não determina Φ: sistemas com a mesma entrada-saída podem ter Φ muito diferente; um computador de programa armazenado que simula um sistema de Φ alto pode ter Φ desprezível (Findlay et al., 2024).
- Medidas "tipo Φ" em dados neurais são substitutos inspirados na teoria, não aproximações do Φ dela — e o próprio Φ não é bem definido para sistemas físicos reais nem foi calculado em nenhum (Barrett et al., 2026).

## Avançado

- A carta de 2023, assinada por mais de cem pesquisadores, chamando a IIT de pseudociência, e a troca publicada na Nature Neuroscience em 2025 contestado.
- O argumento do desdobramento: redes feedforward funcionalmente equivalentes a redes recorrentes têm Φ = 0 contestado.
- Consequências contraintuitivas: grades de portas lógicas simples com Φ enorme (Aaronson) e uma forma de pampsiquismo contestado.
- Pela IIT, computadores digitais convencionais não seriam conscientes, qualquer que seja o software consequência da teoria, não consenso → S11.

## Matemática necessária

**M26**: distâncias entre distribuições e informação; **M30**: grafos e partições; **M22**: probabilidade condicional (TPMs); **M13**: combinatória (a explosão de partições).

## Métodos

- Leia Koch (2019) para a intuição e Albantakis et al. (2023) para a versão 4.0.
- Instale o PyPhi, rode os exemplos de portas lógicas e calcule Φ à mão para um sistema de dois elementos.
- Leia as críticas antes de formar opinião: Doerig et al., Aaronson, e a revisão de Barrett et al. (2026).

## Desafios

- Chamar de Φ qualquer medida de "integração" calculada em software.
- Calcular "Φ" sobre variáveis de alto nível (módulos, tokens, vetores de estado) em vez de elementos físicos com TPM.
- Esquecer que a IIT fala do substrato físico, não do algoritmo.

## Fontes

- 📖 [The Feeling of Life Itself: Why Consciousness Is Widespread but Can't Be Computed](https://doi.org/10.7551/mitpress/11705.001.0001) — Christof Koch, 2019 · livro. a IIT contada por um defensor, sem matemática pesada
- 📄 [Integrated information theory (IIT) 4.0: Formulating the properties of phenomenal existence in physical terms](https://doi.org/10.1371/journal.pcbi.1011465) — Larissa Albantakis et al., 2023 · paper
- 🔧 [PyPhi: A toolbox for integrated information theory](https://doi.org/10.1371/journal.pcbi.1006343) — William G. P. Mayner et al., 2018 · ferramenta
- 📄 [Dissociating Artificial Intelligence from Artificial Consciousness](https://arxiv.org/abs/2412.04571) — Graham Findlay, William Marshall, Larissa Albantakis, Isaac David, William G. P. Mayner, Christof Koch & Giulio Tononi, 2024 · paper
- 📄 [The unfolding argument: Why IIT and other causal structure theories cannot explain consciousness](https://doi.org/10.1016/j.concog.2019.04.002) — Adrien Doerig, Aaron Schurger, Kathryn Hess & Michael H. Herzog, 2019 · paper. crítica
- 🆕 [Integrated information theory: the good, the bad and the misunderstood](https://arxiv.org/abs/2604.11482) — Adam B. Barrett, Borjan Milinkovic, Pedro A. M. Mediano, Fernando E. Rosas, Daniel Bor, Lionel Barnett & Anil K. Seth, 2026 · recente. revisão crítica e equilibrada
- 🌐 [IIT Wiki](https://www.iit.wiki/) — Center for Sleep and Consciousness (Universidade de Wisconsin–Madison) · site. a referência oficial da IIT 4.0
- 🔧 [PyPhi](https://github.com/wmayner/pyphi) — William Mayner et al. · ferramenta. cálculo de Φ da IIT

**Exceções na regra de materiais:**

- sem aula ou vídeo: não há curso em vídeo aberto e estável sobre este tema

## Boss fight

Φ honesto. Parte 1: com o PyPhi, reproduza a ideia central de Findlay et al. — um sistema-alvo pequeno de portas booleanas com Φ > 0 e um computador de programa armazenado, também feito de portas, que o simula com equivalência funcional total; calcule Φ e a estrutura de causa e efeito dos dois e mostre a dissociação. Parte 2: abra o módulo de Φ do Rei Ichi e escreva, sem eufemismo, o que ele calcula — sobre que elementos, com que TPM, com que partições, com que distância — e classifique-o: (a) Φ da IIT sobre o substrato físico; (b) Φ da IIT sobre um modelo abstrato; (c) uma medida de integração inspirada na IIT. Renomeie o módulo de acordo, documente por que, pela própria IIT, ele não mede a consciência do Rei Ichi, e mantenha-o só se tiver função computacional demonstrada.

## Checkpoint

- [ ] Liste os axiomas da IIT 4.0 e traduza um deles em postulado físico.
- [ ] O que é a partição mínima e por que Φ depende dela?
- [ ] Por que dois sistemas funcionalmente equivalentes podem ter Φ diferente segundo a IIT?
- [ ] Por que um "Φ" calculado no software não é o Φ da IIT?
- [ ] O que é o argumento do desdobramento?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
