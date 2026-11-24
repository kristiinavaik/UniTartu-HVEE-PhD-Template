# Instructions for working on this template

## Project

This is a doctoral thesis LaTeX template for the Institute of Estonian and
General Linguistics, University of Tartu. It is adapted from the UniTartu
Computer Science PhD template and a linguistics doctoral thesis.

Read `README.md` and inspect the relevant source files before making changes.
Prefer small, targeted edits. Keep the existing file structure unless the user
explicitly requests a restructuring. The CS template is a reference, not a
reason to replace the linguistics institute's settings.

## Institute and author details

Keep these values exactly as written:

```latex
\institute{Institute of Estonian and General Linguistics}
\faculty{Faculty of Arts and Humanities}
\affiliation{University of Tartu}
```

Author details, thesis titles and supervisors are configured in `metadata.tex`.
The email field supports the example CVs.

Opponent information, acceptance and defence details, dissertation series,
series number, ISSN and ISBNs intentionally remain as placeholders for the
publisher. Do not fill them with guessed values, reuse CS identifiers or tell
the author that they must complete them. Keep these fields in `metadata.tex`;
do not introduce a separate publisher file without a request.

Keep funding text empty unless actual funding information is supplied.

## Existing structure

- `main.tex`: thesis type and order of document parts.
- `metadata.tex`: author, supervisors, institute and publication placeholders.
- `commands.tex`: additional packages and author-specific commands.
- `phdunitartu.cls`: title pages, headings, numbering and document structure.
- `phdstyle.sty`: shared layout, fonts, packages and citation configuration.
- `sections/`: chapters, bibliography, appendices, summary, CVs and publication sections.
- `bibliographies/references.bib`: reference database.
- `figures/`: image files.
- `publications/`: article PDFs for a collection-based thesis.

Preserve both `\ThesisType{MONOGRAPH}` and `\ThesisType{COLLECTION}` support.
The template must compile with publisher placeholders and without external
article PDFs. Keep clear demonstration pages for missing articles.

## Packages and formatting

Put additional `\usepackage` lines at the top of `commands.tex`, before custom
commands and environments. Load a package before its associated configuration,
for example:

```latex
\usepackage{tikz}
\usetikzlibrary{tikzmark, calc}
```

The file already contains commented examples. Keep optional examples commented
unless enabling the package is part of the requested change. `pdfpages` is
already loaded by `phdstyle.sty`; avoid redundant package loading.

Do not add `\documentclass`, `\begin{document}` or `\end{document}` to
`commands.tex`. It is loaded in the preamble by `main.tex`.

Preserve the current doctoral layout, fonts, text area and numbering unless
asked to change them. Do not apply the bachelor's/master's thesis guide to this
doctoral template. Treat choices inferred from one thesis as template defaults,
not as verified institute-wide requirements.

## Citations

Keep **natbib + BibTeX + dcu**, including the existing author-year punctuation
and colon before page numbers. The CS template's biblatex/Biber setup is not
used here. Do not switch systems or introduce `\addbibresource` or
`\printbibliography` without a request to migrate the citation system.

Examples using the supplied fictional records:

```latex
\citet[22]{examplebook}
\citep[30--44]{examplebook}
\citetext{\citealp[30--44]{examplebook}; \citealp{examplearticle}}
```

Keep demonstration references explicitly fictional. Never invent real research
results, citations, publication identifiers or funding claims.

## Documentation and attribution

Keep `README.md` in English and `README.et.md` in Estonian. When changing usage
instructions, update the corresponding instructions in both versions. Preserve
valid LaTeX commands and filenames when translating.

Preserve original authors' and contributors' credits and upstream source links.
Identify Kristiina Vaik as the author of the institute-specific adaptation,
rather than as the sole author of the original template.

The published UniTartuCS Overleaf template lists CC BY 4.0:
https://www.overleaf.com/latex/templates/unitartucs-phd-template/hmxdhtwgvzvm

Preserve any existing licence and attribution notices. If asked to add licensing
information, use the verified upstream terms and distinguish original work
from the adaptation; do not choose a different licence merely because it
appears in a repository host's licence picker.

## Verification

For documentation or comment-only edits, inspect the diff and check that
commands, file paths and active LaTeX code remain correct. Recompilation is not
necessary when active code has not changed.

For changes to layout, class/style code, citations or document structure:

1. Compile both thesis types in separate temporary copies, leaving the user's
   selected thesis type unchanged in the delivered source.
2. Use `latexmk -pdf main.tex`, or `pdflatex`, `bibtex`, then two more
   `pdflatex` passes. Tectonic is also supported.
3. Check for errors, undefined references/citations and overfull boxes.
4. Inspect rendered pages affected by layout changes, including title pages,
   contents, examples and bibliography where relevant.
5. Confirm that the institute names remain correct and publisher placeholders
   have not been populated accidentally.

Keep temporary builds and generated auxiliary files out of the template's
source files. Follow `.gitignore` when working with Git. Before staging files,
check the repository root so that a template nested in another repository does
not accidentally include unrelated files.

## Deliverables

Do not rebuild or update a ZIP archive unless the user explicitly requests it.
Do not regenerate PDF previews for documentation-only changes. When asked for
text or a single file, deliver that text or file without expanding the task.
