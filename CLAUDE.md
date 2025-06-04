# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a LaTeX-based academic manuscript on infectious disease modelling with multiple data sources, synchronized with Overleaf. The repository is for a collaborative research paper targeting submission by end of August 2025.

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

- `main.tex` - Primary manuscript file (Overleaf-synced)
- `figures/` - Organised as raw/, processed/, and final/
- `resources/` - Supporting materials for LLM context and documentation
  - `context/` - Project overview and scope
  - `literature/` - Key references and reviews  
  - `data/` - Data source documentation
  - `methods/` - Technical specifications
  - `minutes/` - Meeting notes and progress tracking

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

## Collaboration Notes

- This repository is synchronized with Overleaf - main branch reflects current manuscript state
- Multiple authors across institutions (LSHTM, Imperial, Cambridge MRC-BSU)
- Sam Abbott (first author), Anne Cori and Anne Presanis (joint last authors)

## Important Reminders

- Do not commit changes unless explicitly requested
- When making LaTeX edits, preserve document structure and formatting
- Check for existing bibliography entries before adding new citations
- Maintain consistency with established notation and terminology