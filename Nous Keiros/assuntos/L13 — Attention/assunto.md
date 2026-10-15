# L13 — Attention

*Atenção*

- **Trilha:** Machine Learning
- **Nível:** 7 — Redes profundas · onda 2
- **Termos:** attention mechanism, self-attention, multi-head attention, positional encoding, RoPE

## Por que importa

Atenção é o mecanismo que deixou cada elemento de uma sequência "consultar" todos os outros, com pesos aprendidos. Nasceu para resolver o gargalo do seq2seq e virou o núcleo dos transformers — e, por analogia contestada, de teorias de atenção e consciência.

## Pré-requisitos

- **Depende de:** L11 (Recurrent networks and sequence modeling), L12 (Representations, embeddings and self-supervised learning)
- **Destrava:** C08 (Numerical precision, efficient attention and frontier kernels), L14 (Transformers)

## Base

1. Atenção de Bahdanau: alinhamento suave entre decoder e encoder **L11**.
2. Atenção como busca suave: consultas (Q), chaves (K) e valores (V); softmax(QKᵀ/√d)·V.
3. Por que dividir por √d: a variância dos produtos escalares cresce com d **M23**.
4. Autoatenção e máscara causal.
5. Atenção multi-cabeça (multi-head).
6. Codificações de posição: senoidais, aprendidas e RoPE, que gira pares de coordenadas com e^{iθ} **M11**.

## Meio

- Complexidade O(n²) e variantes eficientes (esparsa, local, linear) → C08.
- Atenção como memória associativa: redes de Hopfield modernas (Ramsauer et al.).
- Cabeças de indução e aprendizado em contexto → L24.

## Avançado

- RoPE e extensão de contexto (escalonamento NTK, YaRN).
- Atenção como roteamento de informação e o paralelo contestado com a seleção atencional e o espaço de trabalho global → S03.
- Limites de expressividade da autoatenção → L25.

## Matemática necessária

**M11**: complexos (RoPE); **M23**: variância; **M21**: gradientes matriciais.

## Métodos

- Implemente atenção de uma e de várias cabeças do zero, com máscara causal, e confira contra o PyTorch.
- Visualize mapas de atenção em tarefas simples (reverter sequência, converter datas).
- Prove que a RoPE torna o produto ⟨q, k⟩ dependente só da distância relativa.

## Desafios

- Ler pesos de atenção como explicação ("attention is not explanation").
- Erros de máscara que vazam o futuro.
- Esquecer a escala √d e saturar a softmax.

## Fontes

- 📄 [Neural Machine Translation by Jointly Learning to Align and Translate](https://arxiv.org/abs/1409.0473) — Dzmitry Bahdanau, Kyunghyun Cho & Yoshua Bengio, 2014 · paper
- 📄 [Attention Is All You Need](https://arxiv.org/abs/1706.03762) — Ashish Vaswani et al., 2017 · paper
- 📄 [RoFormer: Enhanced Transformer with Rotary Position Embedding](https://arxiv.org/abs/2104.09864) — Jianlin Su et al., 2021 · paper
- 📄 [Hopfield Networks is All You Need](https://arxiv.org/abs/2008.02217) — Hubert Ramsauer et al., 2020 · paper
- 📄 [Attention is not Explanation](https://arxiv.org/abs/1902.10186) — Sarthak Jain & Byron C. Wallace, 2019 · paper
- 📖 [Understanding Deep Learning](https://udlbook.github.io/udlbook/) — Simon J. D. Prince, 2023 · livro. cap. 12

## Boss fight

Implemente do zero um seq2seq com atenção de Bahdanau e um modelo só de autoatenção (multi-cabeça, máscara causal, RoPE) e treine ambos em tarefas sintéticas (reverter sequências, somar números, converter datas). Visualize os mapas de atenção, demonstre numericamente que a RoPE depende só da posição relativa e exiba um caso em que os pesos de atenção não explicam a decisão do modelo.

## Checkpoint

- [ ] Escreva a fórmula da atenção e explique o papel de Q, K e V.
- [ ] Por que dividir por √d?
- [ ] O que a máscara causal impede?
- [ ] Por que pesos de atenção não são, sozinhos, uma explicação?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
