# N15 — Motor control, the cerebellum and internal models

*Controle motor, cerebelo e modelos internos*

- **Trilha:** Computational Neuroscience
- **Nível:** 11 — Segurança · onda 1
- **Termos:** motor control, cerebellum, forward models, optimal feedback control
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Mover o corpo é um problema de controle sob atraso, ruído e incerteza que o cérebro resolve melhor do que qualquer robô. Modelos internos, controle ótimo com feedback e o cerebelo como aprendiz supervisionado são a base da robótica cognitiva — e dos 28 graus de liberdade que você mapeou para a futura corporificação do Rei Ichi.

## Pré-requisitos

- **Depende de:** N05 (Neural network dynamics and attractors), R11 (Optimal control and RL theory)
- **Destrava:** B06 (Cognitive robotics and embodied AI)

## Base

1. Modelos internos: direto (prevê consequências) e inverso (calcula comandos) (Wolpert, Ghahramani & Jordan).
2. Controle ótimo com feedback e o princípio da intervenção mínima (Todorov & Jordan) **R11**.
3. O cerebelo: arquitetura cristalina e fibras trepadeiras como sinal de erro; as teorias de Marr (1969) e Albus (1971).
4. Aprendizado supervisionado no cerebelo e adaptação motora.
5. Córtex motor como sistema dinâmico: dinâmica rotacional de populações durante o alcance (Churchland et al.) **N05**.
6. Hierarquia de controle motor em mamíferos e máquinas.

## Meio

- Integração sensório-motora bayesiana e compensação de atrasos.
- Adaptação a campos de força com processos rápidos e lentos.
- Um roedor virtual em física simulada prevê a estrutura da atividade neural (Aldarondo et al., 2024).

## Avançado

- Modelos de mundo para controle e robótica → R09, → B06.
- O cerebelo além do movimento: cognição e linguagem contestado
- Controle motor em robôs com modelos de visão-linguagem-ação → B06.

## Matemática necessária

**M27**: otimização; **M28**: dinâmica; **M21**: cálculo matricial (LQR e filtro de Kalman); **M22**: probabilidade.

## Métodos

- Implemente LQR com filtro de Kalman num braço de duas articulações e reproduza o princípio da intervenção mínima.
- Implemente um cerebelo tipo perceptron (Marr-Albus) aprendendo a corrigir erros.
- Use Shadmehr & Mussa-Ivaldi como livro de referência.

## Desafios

- Ignorar os atrasos sensoriais.
- Confundir trajetória pré-planejada com controle por feedback.

## Fontes

- 📖 [Biological Learning and Control: How the Brain Builds Representations, Predicts Events, and Makes Decisions](https://doi.org/10.7551/mitpress/9780262016964.001.0001) — Reza Shadmehr & Sandro Mussa-Ivaldi, 2012 · livro
- 📄 [An Internal Model for Sensorimotor Integration](https://doi.org/10.1126/science.7569931) — Daniel M. Wolpert, Zoubin Ghahramani & Michael I. Jordan, 1995 · paper
- 📄 [Optimal feedback control as a theory of motor coordination](https://doi.org/10.1038/nn963) — Emanuel Todorov & Michael I. Jordan, 2002 · paper
- 📄 [A theory of cerebellar cortex](https://doi.org/10.1113/jphysiol.1969.sp008820) — David Marr, 1969 · paper
- 📄 [Neural population dynamics during reaching](https://doi.org/10.1038/nature11129) — Mark M. Churchland et al., 2012 · paper
- 🆕 [A virtual rodent predicts the structure of neural activity across behaviours](https://doi.org/10.1038/s41586-024-07633-4) — Diego Aldarondo et al., 2024 · recente

## Boss fight

No MuJoCo, simule um braço planar de duas articulações e depois um subconjunto dos 28 graus de liberdade do esqueleto do Rei Ichi. Implemente controle ótimo com feedback (LQR iterativo + Kalman), um modelo direto aprendido que compensa atraso sensorial e um módulo tipo cerebelo que adapta a um campo de força; reproduza a adaptação e o efeito posterior quando o campo é removido.

## Checkpoint

- [ ] Diferencie modelo interno direto e inverso.
- [ ] O que é o princípio da intervenção mínima?
- [ ] Qual o papel das fibras trepadeiras na teoria de Marr-Albus?
- [ ] O que é dinâmica rotacional no córtex motor?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
