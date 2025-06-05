# Integrating Multiple Data Sources in Infectious Disease Modelling

> **Note**: This repository is synchronised with Overleaf. The main branch reflects the current state of the manuscript.

## Overview

Infectious disease modelling increasingly relies on integrating multiple data sources to improve parameter estimation and reduce uncertainty.
However, practitioners face complex choices about how to combine diverse data streams, from full joint modelling to modular approaches that fit sub-models separately before integration.
This paper provides a comprehensive framework for integrating multiple data sources in infectious disease modelling, with transmission intensity estimation as a key exemplar.
We review data source characteristics, present a structured workflow for model development, and compare integration approaches including joint modelling, evidence synthesis methods, and ensemble techniques.
Through worked case studies progressing from single data sources to multi-stream integration, we demonstrate how different data types provide complementary information for estimating parameters such as time-varying reproduction numbers and overdispersion.
We discuss computational considerations, model validation strategies, and practical implementation challenges.
Our modular framework emphasises parsimony, interpretability, and systematic assessment of conflict between data sources.
This work addresses a critical gap in the literature by providing practical guidance for infectious disease modellers on data integration choices, supported by reproducible examples and decision-making frameworks.

## Authors

![Team Photo](figures/team-photo.jpg)

- Sam Abbott (London School of Hygiene & Tropical Medicine)
- Xiahui Li (University of St Andrews)
- Punya Alahakoon (University of Oxford)
- Dhorasso Junior Temfack Nguefack (Trinity College Dublin)
- Johannes Bracher (Karlsruhe Institute of Technology)
- Felix Günther (Robert Koch Institute)
- working group members...
- workshop participants who contributed to the manuscript...
- Mircea T. Sofonea (University of Montpellier, France)
- Michael Plank (University of Canterbury, New Zealand)
- Anne Presanis (MRC Biostatistics Unit, University of Cambridge)†
- Anne Cori (Imperial College London)†

† Joint last authors

## Repository Structure

```
├── main.tex           # Main manuscript file
├── figures/           # Manuscript figures and plots
├── resources/         # Supporting materials and context for LLMs
└── README.md         # This file
```

## Manuscript Status

- **Current status**: Draft
- **Target journal**: PLOS Computational Biology (under consideration)
- **Submission deadline**: End of August 2025
- **Target word count**: 5,000 words
- **Current word count**: @word-count

## Citation

```bibtex
@placeholder-citation
```

## Contact

For questions about this manuscript, please contact:
- Sam Abbott (sam.abbott@lshtm.ac.uk)
- Anne Cori (a.cori@imperial.ac.uk)
- Anne Presanis (anne.presanis@mrc-bsu.cam.ac.uk)

## License

MIT License - see [LICENSE](LICENSE) file for details.