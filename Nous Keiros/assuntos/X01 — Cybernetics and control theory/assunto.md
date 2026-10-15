# X01 — Cybernetics and control theory

*Cibernética e teoria de controle*

- **Trilha:** Cybernetics & Complex Systems
- **Nível:** 5 — A matemática do aprendizado · onda 2
- **Termos:** cybernetics, feedback control, requisite variety, good regulator theorem
- **Projetos KEIROS:** MUSUBI

## Por que importa

Antes de "inteligência artificial" virar nome de área, a cibernética já estudava controle e comunicação no animal e na máquina: realimentação, homeostase, variedade necessária. O teorema do bom regulador diz que todo bom controlador precisa conter um modelo do sistema — ideia que voltou em 2025 como "agentes gerais contêm modelos de mundo".

## Pré-requisitos

- **Depende de:** M28 (Differential equations and dynamical systems)
- **Destrava:** X02 (Self-organization, emergence and criticality)

## Base

1. Realimentação negativa e positiva; o laço sensor → comparador → atuador **M28**.
2. Wiener (1948): cibernética como controle e comunicação no animal e na máquina.
3. Ashby: a lei da variedade necessária ("só variedade absorve variedade") e a homeostase (o homeostato).
4. O teorema do bom regulador (Conant & Ashby, 1970): todo bom regulador de um sistema precisa ser um modelo desse sistema.
5. Controle clássico: estabilidade, resposta em frequência e o controlador PID **M11**.
6. Espaço de estados, controlabilidade e observabilidade **M18**.

## Meio

- Agentes gerais contêm modelos de mundo (Richens et al., 2025): uma versão formal e moderna do bom regulador.
- Cibernética de segunda ordem: o observador dentro do sistema.
- Controle ótimo e RL como herdeiros da cibernética → R11.

## Avançado

- Homeostase e motivação em agentes → G08
- Auto-organização e emergência → X02
- Cibernética como linguagem para o MUSUBI: laços, variedade e regulação.

## Matemática necessária

**M28**: EDOs lineares e estabilidade; **M18**: autovalores e estabilidade de sistemas lineares; **M11**: números complexos (polos e frequências).

## Métodos

- Leia os primeiros capítulos de An Introduction to Cybernetics (Ashby), disponível em PDF aberto.
- Use o livro aberto de Åström & Murray (Feedback Systems) para o controle clássico e moderno.
- Implemente um PID e um controle por realimentação de estado para um pêndulo invertido simulado.

## Desafios

- Usar "cibernética" como estética, sem as equações.
- Esquecer que realimentação também desestabiliza (atraso, ganho alto).

## Fontes

- 📖 [Cybernetics: Or Control and Communication in the Animal and the Machine (reedição 2019)](https://doi.org/10.7551/mitpress/11810.001.0001) — Norbert Wiener, 1948 · livro
- 📖 [An Introduction to Cybernetics](http://pespmc1.vub.ac.be/books/IntroCyb.pdf) — W. Ross Ashby, 1956 · livro
- 📖 [Feedback Systems: An Introduction for Scientists and Engineers](https://fbswiki.org/) — Karl J. Åström & Richard M. Murray · livro. livro aberto
- 📄 [Every good regulator of a system must be a model of that system](https://doi.org/10.1080/00207727008920220) — Roger C. Conant & W. Ross Ashby, 1970 · paper
- 🆕 [General agents contain world models](https://arxiv.org/abs/2506.01622) — Jonathan Richens, David Abel, Alexis Bellot & Tom Everitt, 2025 · recente

## Boss fight

Escreva em C, para o M1, um simulador de pêndulo invertido e controle-o com PID e com realimentação de estado por alocação de polos: mostre estabilidade, a instabilidade causada por atraso e a robustez a ruído. Depois faça a análise cibernética do MUSUBI: quais são os laços de realimentação, onde fica o comparador, qual é a variedade do ambiente frente à variedade de respostas do sistema — e onde, pelo teorema do bom regulador, deveria existir um modelo explícito que hoje não existe.

## Checkpoint

- [ ] O que é realimentação negativa e por que ela estabiliza?
- [ ] Enuncie a lei da variedade necessária.
- [ ] O que diz o teorema do bom regulador?
- [ ] O que fazem os termos P, I e D de um controlador PID?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
