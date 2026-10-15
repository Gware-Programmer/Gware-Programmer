# K03 — ACT-R

*ACT-R*

- **Trilha:** Cognitive Architectures
- **Nível:** 3 — Cálculo e incerteza · onda 2
- **Termos:** ACT-R, declarative memory, activation, production compilation
- **Projetos KEIROS:** Rei Ichi

## Por que importa

ACT-R é a arquitetura cognitiva que mais previu dados humanos com precisão — tempos de reação, erros, esquecimento, até ativação cerebral. Suas equações de ativação da memória são matemática pequena, testável e diretamente útil para o sistema de memória de qualquer agente.

## Pré-requisitos

- **Depende de:** K01 (What is a cognitive architecture), M22 (Probability: events, conditioning and Bayes)
- **Destrava:** K04 (LIDA, CLARION, Sigma and consciousness-inspired architectures), K06 (Cognitive architectures for language agents)

## Base

1. Módulos e buffers: visual, motor, declarativo, de objetivo e imaginário; cada buffer guarda um único "chunk" **K01**.
2. Memória procedural de produções, com uma produção disparada por ciclo (~50 ms).
3. Memória declarativa e ativação: A = B + Σ W·S + ruído.
4. Aprendizado de nível-base: B = ln(Σ tⱼ^(−d)), com d ≈ 0,5 — frequência e recência numa fórmula só **M09**.
5. Recuperação: probabilidade logística em função do limiar τ; latência T = F·e^(−A) **M22**.
6. Ativação por espalhamento e o efeito leque (fan effect): S_ji = S − ln(fan_j).

## Meio

- Utilidade das produções aprendida por diferença temporal (antecipa a lógica do RL → R04).
- Compilação de produções: de declarativo para procedural com a prática.
- Ajuste de parâmetros a dados comportamentais; validação cruzada entre tarefas.
- Mapeamento de módulos em regiões cerebrais e predições de sinal de fMRI.

## Avançado

- ACT-R como memória para agentes de linguagem: recência e frequência para recuperação → A04.
- Tutores cognitivos: sistemas de ensino baseados em ACT-R usados em escolas reais.
- Comparação estrutural com Soar → K07.

## Matemática necessária

**M09**: logaritmos e potências; **M22**: probabilidade (recuperação logística e ruído).

## Métodos

- Use o pyactr (Python) e o livro aberto de Brasoveanu & Dotlačil para os primeiros modelos.
- Implemente as equações de ativação do zero antes de usar a biblioteca.
- Ajuste o parâmetro de decaimento a dados de esquecimento (Ebbinghaus replicado) → G03.

## Desafios

- Muitos parâmetros livres ajustados por tarefa: risco de sobreajuste.
- Esquecer o ruído na ativação (sem ele não há erros de recuperação).

## Fontes

- 📖 [How Can the Human Mind Occur in the Physical Universe?](https://doi.org/10.1093/acprof:oso/9780195324259.001.0001) — John R. Anderson, 2007 · livro
- 📄 [An Integrated Theory of the Mind](https://doi.org/10.1037/0033-295X.111.4.1036) — John R. Anderson, Daniel Bothell, Michael D. Byrne, Scott Douglass, Christian Lebiere & Yulin Qin, 2004 · paper
- 📖 [Computational Cognitive Modeling and Linguistic Theory](https://doi.org/10.1007/978-3-030-31846-8) — Adrian Brasoveanu & Jakub Dotlačil, 2020 · livro. acesso aberto, com pyactr
- 🔧 [jakdot/pyactr](https://github.com/jakdot/pyactr) — Jakub Dotlačil · ferramenta
- 🌐 [ACT-R — official site, tutorials and software](http://act-r.psy.cmu.edu/) — Carnegie Mellon University · site

**Exceções na regra de materiais:**

- sem aula ou vídeo: não há curso em vídeo aberto e estável sobre este tema

## Boss fight

Implemente do zero, em Python e depois em C, a memória declarativa do ACT-R: nível-base com decaimento, espalhamento, ruído logístico, limiar e latência. Reproduza qualitativamente o efeito leque e a curva de esquecimento, ajuste d e τ por busca em grade minimizando o erro (a versão por máxima verossimilhança vem com → M24) e mostre o efeito de espaçamento. Por fim, use essa memória como mecanismo de recuperação do Rei Ichi e compare com recuperação por similaridade pura.

## Checkpoint

- [ ] Escreva a equação de aprendizado de nível-base e explique cada termo.
- [ ] Por que a latência de recuperação cai exponencialmente com a ativação?
- [ ] O que é o efeito leque e como o ACT-R o explica?
- [ ] Qual o papel do ruído na ativação?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
