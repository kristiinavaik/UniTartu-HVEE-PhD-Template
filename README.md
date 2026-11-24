# Doctoral thesis example template for the Institute of Estonian and General Linguistics

A LaTeX example template for a doctoral thesis project.
The template contains placeholders.
The main language is English; the Estonian summary and curriculum vitae are
provided in separate files.

[Eestikeelne juhend / Estonian guide](README.et.md)


## Credits

This template is based on the
[UniTartu Computer Science PhD thesis template](https://gitlab.cs.ut.ee/unitartucs-thesis-templates/phd-latex-template).

The original LaTeX class and template were created by Reimo Palm, Dmytro Fishman, Novin Shahroudi, Kalmer Apinis, Liisa Rätsep and Jaak Vilo.

## Institute-specific adaptation

Adapted for the Institute of Estonian and General Linguistics,
University of Tartu, by Kristiina Vaik.

The adaptation includes institute-specific information, citation
settings, cleaned examples and documentation.

## Quick start in Overleaf

1. Upload the ZIP file to Overleaf: **New Project > Upload Project**.
2. Set `main.tex` as the main document and select **pdfLaTeX** as the compiler.
3. Complete `metadata.tex` with the author name, thesis titles and supervisor(s).
   Leave the opponent, defence and publication fields open for the publisher.
4. At the beginning of `main.tex`, choose `\ThesisType{MONOGRAPH}` or
   `\ThesisType{COLLECTION}`.
5. Replace the example text in `sections/` with your own content and add real
   references to `bibliographies/references.bib`.
6. Click **Recompile**. Overleaf runs BibTeX automatically when needed.

The institute is already set to the **Institute of Estonian and General Linguistics**,
**Faculty of Arts and Humanities**, **University of Tartu**. Keep these values.
The opponent, defence and publication placeholders remain in `metadata.tex`;
there is no separate publisher file, and authors do not need to complete them.

Both thesis types compile without additional image files or article PDFs.
Use `commands.tex` to add your own packages and commands.

## Files

| File or folder | Purpose |
| --- | --- |
| `main.tex` | Thesis type, order of sections and chapter inputs. |
| `metadata.tex` | Author and thesis details, including an optional funding statement. |
| `commands.tex` | Author-specific packages and commands; a simple linguistic example environment. |
| `phdunitartu.cls` | Title pages, chapter headings, numbering and document structure. |
| `phdstyle.sty` | Fonts, text area, packages, citation settings and helper commands. |
| `sections/` | Chapters, summary, appendices, CVs and publication sections. |
| `bibliographies/references.bib` | Demonstration references to replace with real sources. |
| `figures/` | Your image files. |
| `publications/` | Article PDFs for a collection-based thesis. |

## Editing the content

- To add a chapter, create a file and add the corresponding
  `\input{sections/name}` command to `main.tex`.
- To omit a section, comment out its `\input` line.
- For an unnumbered chapter with a table of contents entry, use
  `\unnumberedchapter{Title}`. For one without a contents entry, use
  `\chapter*{Title}`.
- Add your own packages and commands to `commands.tex`.
- Place images in `figures/` and replace the example frame with an
  `\includegraphics` command.
- Examples of a table, figure and numbered linguistic example are provided in
  `sections/methods.tex`.
- For more complex glossed examples, add a suitable glossing package.
- The list of abbreviations is a simple table and does not require a separate
  glossary-generation step.
- The Estonian sections use the `otherlanguage` environment; the main document
  language is English. For a thesis written entirely in Estonian, adjust the
  main language, chapter titles, title-page wording and the summary in another
  language as appropriate.

## Collection-based doctoral thesis

Set `\ThesisType{COLLECTION}` in `main.tex`. This adds a publication list with
placeholders for author contributions, followed later by the article section.

1. Complete `sections/publications-list.tex`.
2. Complete the article records and permission or licence statements in
   `sections/publications.tex`.
3. Add `publications/article-1.pdf` and `publications/article-2.pdf`.
4. Add or remove article blocks to match your thesis.

The two article blocks are examples only and do not indicate a required number
of articles. If an article PDF is missing, a clearly labelled demonstration page
appears in its place. The template contains no actual articles or PDFs from the
original project.

## Citations and references

The original project's `natbib` + `dcu` author-year setup and citation punctuation
settings have been retained. Examples: `\citet{examplebook}`,
`\citep{examplearticle}` and `\citep[12--14]{examplebook}`.

The two records in the BibTeX file are fictional and explicitly labelled as
demonstration references. Replace them before writing your thesis. The `dcu`
style is a working starting point; it has not been verified against any
mandatory institutional citation style. Change the bibliography style in
`sections/bibliography.tex` if necessary.

## Layout and details to confirm

The template retains the original project's A4 page size, 11-point body text,
Times-like `mathptmx` font, Helvetica-like headings, 125 mm text width, and
text-height and spacing settings. The figure and table caption font setting
also comes from the original project's main file. These are not the settings
from the bachelor's and master's thesis guidelines.

Page numbering continues automatically after the title pages, without a
hard-coded starting number. Figures, tables, footnotes and equations in the main
text are numbered continuously; appendix equations use appendix-based numbering.

This is a working example template, not an officially approved institutional
template. The publisher completes the opponent, acceptance and defence details,
dissertation series information and publication identifiers. These fields may
remain as placeholders while the author writes the thesis. The Press's guidance, including a link to a suitable LaTeX template,
is available in its [manuscript preparation guidelines](https://tyk.ee/et/nouded-kasikirjadele).

The formatting rules from the supplied general bachelor's and master's thesis
guidelines have not been automatically applied to this doctoral thesis template.

## Compiling locally

With TeX Live or MiKTeX installed:

```sh
latexmk -pdf main.tex
```

Without `latexmk`:

```sh
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

## License

This template adaptation is distributed under the
[Creative Commons Attribution 4.0 International license
(CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).

It is based on the UniTartuCS PhD Template, published under
CC BY 4.0. Original authors and contributors are credited above.

Adapted for the Institute of Estonian and General Linguistics,
University of Tartu, by Kristiina Vaik.
