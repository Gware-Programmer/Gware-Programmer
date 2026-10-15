# AL09 — AI governance and licensing of data and models

*Governança de IA e licenças de dados e modelos*

- **Trilha:** Alignment & Safety
- **Nível:** 8 — Escala · onda 1
- **Termos:** AI governance, software licenses, open weights, open source AI definition, responsible AI licenses, copyright and text and data mining, data protection, EU AI Act, model cards, datasheets, data provenance
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Criar a sua própria IA envolve dados e pesos de terceiros e, um dia, publicar algo seu. Licenças de dados e modelos, direito autoral, privacidade e as novas leis de IA definem o que você pode treinar, usar e distribuir — e mudam de país para país. Um pesquisador que vai morar no Japão precisa conhecer o básico do Brasil, do Japão e da União Europeia.

## Pré-requisitos

- **Depende de:** AL01 (The alignment problem: specification and Goodhart)
- **Destrava:** AL08 (Safe self-improvement, corrigibility and technical governance), Z02 (Pretrain a small LLM end to end)

## Base

1. Licenças de software e de conteúdo: MIT, Apache-2.0, GPL e Creative Commons.
2. Licenças de pesos: pesos abertos vs. código aberto; licenças com restrição de uso (RAIL, licenças comunitárias).
3. Dados de treino e direito autoral: mineração de texto e dados; a exceção do artigo 30-4 da lei japonesa e o debate em outros países.
4. Privacidade: LGPD (Brasil), APPI (Japão) e GDPR (União Europeia) aplicadas a dados de treino.
5. O AI Act da União Europeia: classes de risco e obrigações para modelos de propósito geral.
6. Documentação: model cards e datasheets.
7. Proveniência e consentimento: auditorias de licença de conjuntos de dados **AL01**.

## Meio

- Gestão de risco: o NIST AI RMF.
- A definição de IA de código aberto da OSI e o que ela exige.
- Responsabilidade por saídas do modelo e por uso indevido.
- Relatórios internacionais de segurança e políticas de escala responsável.

## Avançado

- Governança técnica: avaliações obrigatórias, limiares de computação e rastreabilidade (prévia de → AL08).
- Marca d'água e detecção de conteúdo gerado.
- O declínio dos dados abertos na web: robots.txt e termos de uso.

## Matemática necessária

Sem matemática nova.

## Métodos

- Leia no texto oficial do AI Act as partes sobre modelos de propósito geral.
- Escolha três modelos abertos e compare as licenças: o que cada uma permite treinar, modificar e redistribuir.
- Escreva o datasheet do seu corpus e o model card do seu modelo.

## Desafios

- Achar que "público na internet" significa "livre para treinar".
- Confundir pesos abertos com código aberto.
- Tratar as leis como estáticas: elas mudam rápido.

## Fontes

- 📊 [Regulation (EU) 2024/1689 (Artificial Intelligence Act)](https://eur-lex.europa.eu/eli/reg/2024/1689/oj) — União Europeia, 2024 · relatório
- 📊 [Artificial Intelligence Risk Management Framework (AI RMF 1.0)](https://doi.org/10.6028/NIST.AI.100-1) — Elham Tabassi (NIST), 2023 · relatório
- 📄 [Model Cards for Model Reporting](https://arxiv.org/abs/1810.03993) — Margaret Mitchell et al., 2019 · paper
- 📄 [Datasheets for Datasets](https://arxiv.org/abs/1803.09010) — Timnit Gebru et al., 2021 · paper
- 📄 [The Data Provenance Initiative: A Large Scale Audit of Dataset Licensing & Attribution in AI](https://arxiv.org/abs/2310.16787) — Shayne Longpre et al., 2023 · paper
- 🆕 [Consent in Crisis: The Rapid Decline of the AI Data Commons](https://arxiv.org/abs/2407.14933) — Shayne Longpre et al., 2024 · recente
- 📄 [Behavioral Use Licensing for Responsible AI](https://arxiv.org/abs/2011.03116) — Danish Contractor et al., 2022 · paper
- 🌐 [The Open Source AI Definition 1.0](https://opensource.org/ai/open-source-ai-definition) — Open Source Initiative · site
- 🌐 [Copyright Act (Japan)](https://www.japaneselawtranslation.go.jp/en/laws/view/4207) — Japanese Law Translation, Ministério da Justiça do Japão · site
- 🌐 [Lei Geral de Proteção de Dados Pessoais (Lei nº 13.709/2018)](https://www.planalto.gov.br/ccivil_03/_ato2015-2018/2018/lei/l13709.htm) — Presidência da República (Brasil) · site
- 🎓 [AI Governance](https://bluedot.org/courses/governance) — BlueDot Impact · curso

## Boss fight

Escreva o dossiê legal e de documentação da sua IA: para cada fonte de dados e cada modelo de base que você usa, a licença, o que ela permite e o risco; o datasheet do seu corpus e o model card do seu modelo; e uma análise de como o projeto se enquadra nas regras de dados e de IA do Brasil, do Japão e da União Europeia. Diga o que mudaria antes de publicar os pesos.

## Checkpoint

- [ ] Qual a diferença entre pesos abertos e IA de código aberto, segundo a definição da OSI?
- [ ] O que a exceção do artigo 30-4 da lei de direitos autorais do Japão permite?
- [ ] Que obrigações o AI Act cria para provedores de modelos de propósito geral?
- [ ] O que vai num model card e num datasheet?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
