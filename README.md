# A Workflow for Infectious Disease Modelling

> **Note**: This repository is synchronised with Overleaf. The main branch reflects the current state of the manuscript.

## Overview

Infectious disease models can be used to inform critical public health decisions, yet often lack systematic development and validation practices.
The infectious disease modelling community has been slow to adopt rigorous model development and criticism cycles such as the Bayesian workflow, even as these methods become increasingly formalised and widely used in other domains. Recent outbreaks have demonstrated some domain-specific challenges that infectious disease modelling faces, including evolving research questions, emerging data sources, and adapting surveillance systems.
Here, we suggest a workflow for developing and evaluating infectious disease models, building on general Bayesian workflow advice and focusing on domain-specific challenges. As infectious disease models typically require multiple sources of information, the Bayesian paradigm is a natural framework. This workflow is designed for anyone developing an infectious disease model, and for users of model outputs who need to be able to evaluate modelling studies. At each stage, we provide recommendations based on our experience. We begin by outlining an approach for characterising epidemiological data source properties through a structured checklist. We then present an iterative workflow that extends the Bayesian workflow to the infectious disease domain, with the checklist informing decisions throughout each workflow stage. Our workflow includes defining the research question, development of Directed Acyclic Graph representations of process and observation models in a state-space framework, model modularisation, inference and computation choices, model specification and validation, integration method selection, and real-world considerations. 
Throughout, we identify feedback loops where later decisions impact earlier choices. We also give guidance on using the workflow in evolving settings, such as outbreaks, and on how to report its use. To demonstrate this workflow, we use four schematic case studies that progressively integrate data sources for estimating transmission intensity.
In each one, we give examples of navigating real-world trade-offs between model complexity, computational feasibility, and inferential goals.
These case studies highlight how different data types can provide complementary information but may also impact other workflow choices. 
Our suggested framework emphasises parsimony, modularity, interpretability, and model criticism. By proposing domain-specific workflow practices, we aim to provide a foundation for improving the quality and transparency of infectious disease modelling, particularly during outbreaks where flexible, principled approaches are essential. 
## Authors

![Team Photo](figures/team-photo.jpg)

- Sam Abbott (London School of Hygiene & Tropical Medicine)
- Xiahui Li† (School of Mathematics and Statistics, University of St Andrews)
- Punya Alahakoon† (University of Oxford)
- Dhorasso Temfack† (School of Computer Science and Statistics, Trinity College Dublin)
- Johannes Bracher (Karlsruhe Institute of Technology)
- Felix Günther (Robert Koch Institute)
- Sabine Van Elsland (MRC Centre for Global Infectious Disease Analysis, Imperial College London)
- Adrian Lison (Computational Evolution, ETH Zurich)
- James Hay (Nuffield Department of Medicine, University of Oxford)
- Oliver Eales (School of Mathematics and Statistics, University of Melbourne)
- Eben Kenah (College of Public Health, Ohio State University)
- James McCaw (School of Mathematics and Statistics, University of Melbourne)
- Freya Shearer (School of Population and Global Health, University of Melbourne)
- Sebastian Funk (London School of Hygiene & Tropical Medicine)
- Mircea T. Sofonea (University of Montpellier)
- Pierre Nouvellet (MRC Centre for Global Infectious Disease Analysis, Imperial College London & School of Life Sciences, University of Sussex)
- Daniela De Angelis (MRC Biostatistics Unit, University of Cambridge)
- Michael J. Plank* (School of Mathematics and Statistics, University of Canterbury)
- Anne Cori* (MRC Centre for Global Infectious Disease Analysis, Imperial College London)
- Anne Presanis* (MRC Biostatistics Unit, University of Cambridge)

† Equal contribution
* Joint last authors

**Note:** Author order is provisional and subject to change.

## Repository Structure

```
├── main.tex              # Main manuscript file
├── supplementary.tex     # Supplementary information
├── figures/              # Manuscript figures and plots
├── supplement_figures/   # Supplementary figures
├── resources/            # Supporting materials and context for LLMs
└── README.md            # This file
```

## Citation

```bibtex
@placeholder-citation
```

## Contact

For questions about this manuscript, please contact:
- Sam Abbott (sam.abbott@lshtm.ac.uk)
- Anne Cori (a.cori@imperial.ac.uk)
- Anne Presanis (anne.presanis@mrc-bsu.cam.ac.uk)
- Michael Plank (mike.plank@canterbury.ac.nz)

## License

MIT License - see [LICENSE](LICENSE) file for details.