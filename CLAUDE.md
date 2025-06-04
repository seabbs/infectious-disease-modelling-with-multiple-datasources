# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX-based academic manuscript on infectious disease modelling with multiple data sources, synchronized with Overleaf. The repository is for a collaborative research paper targeting submission to PLOS Computational Biology by end of August 2025.

**Key Project Elements:**
- Framework for integrating multiple data sources in infectious disease modelling
- Expert survey of workshop participants rating data source characteristics
- Structured workflow with DAG-based model development (includes visual schematic)
- Progressive case studies from single-source to multi-stream integration
- Transmission intensity estimation as exemplar application

## Key Commands

### LaTeX Compilation
```bash
# Standard LaTeX compilation (if pdflatex is available)
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex

# Using latexmk (preferred method)
latexmk -pdf main.tex

# Clean auxiliary files
latexmk -c main.tex
```

### Word Count
For manuscript word counts (excluding references and code blocks):
```bash
cat main.tex | sed '/\\begin{document}/,/\\end{document}/!d' | sed 's/\\[^{]*{[^}]*}//g' | sed 's/\\[^{]*{//g' | sed 's/}//g' | wc -w
```

## Repository Structure

- `main.tex` - Primary manuscript file (Overleaf-synced) with complete section structure
- `figures/` - Manuscript figures including team-photo.jpg and workflow-schematic.png
- `resources/` - Supporting materials for LLM context and documentation
  - `context/` - Project overview and scope
  - `literature/` - Key references and reviews  
  - `data/` - Data source documentation
  - `methods/` - Technical specifications
  - `minutes/` - Meeting notes and progress tracking (core-team.md, most-recent.md)
  - `raw/` - Original project materials including workflow schematic and data integration content

## LaTeX Guidelines

- Use UK English throughout
- One sentence per line in LaTeX source
- Max 80 characters per line
- No trailing whitespace
- Use `@placeholder` for missing citations/references

## Writing Style

Follow the example in the user's global CLAUDE.md:
- Simple, direct prose without unnecessary adjectives
- Clear structure: problem statement → approaches → limitations → solution
- Focus on precision and clarity over elaborate language
- Use direct recommendation tone: "We recommend...", "Start with...", "Select among..."
- Avoid abstract third-person descriptions ("The workflow emphasises..." → "We emphasise...")

## Content Guidelines

- Data integration section must use verbatim content from `resources/raw/data-integration.md`
- Workflow section follows structured approach from schematic: research question → process DAG → data sources → observation DAG → integration → inference
- Prioritise practical implementation over theoretical discussion
- Communication and interpretation are priority areas for practical considerations

## Collaboration Notes

- This repository is synchronized with Overleaf - main branch reflects current manuscript state
- Multiple authors across institutions (LSHTM, Imperial, Cambridge MRC-BSU, Oxford, St Andrews, Trinity College Dublin, Canterbury)
- Sam Abbott (first author), Anne Cori and Anne Presanis (joint last authors)
- Section leads: Sam Abbott (intro, workflow, practical considerations), Punya Alahakoon (data sources), Anne Presanis (data integration, fitting choices), Anne Cori (case studies)

## Important Reminders

- Do not commit changes unless explicitly requested
- When making LaTeX edits, preserve document structure and formatting
- Check for existing bibliography entries before adding new citations
- Maintain consistency with established notation and terminology