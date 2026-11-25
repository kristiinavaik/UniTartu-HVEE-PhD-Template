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

1. On GitHub, choose **Code > Download ZIP**, then upload that file to Overleaf: **New Project > Upload Project**.
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
| `publications/` | Article PDFs and the single article-data file `articles.tex`. |

## Editing the content

- To add a chapter, create a file and add the corresponding
  `\input{sections/name}` command to `main.tex`.
- To omit a section, comment out its `\input` line.
- For an unnumbered chapter with a table of contents entry, use
  `\unnumberedchapter{Title}`. For one without a contents entry, use
  `\chapter*{Title}`.
- Add your own packages and commands to `commands.tex`. It is loaded before
  `hyperref`, so packages that need to precede `hyperref` can go there.
- Place images in `figures/` and replace the example frame with an
  `\includegraphics` command.
- Examples of a table, figure and numbered linguistic example are provided in
  `sections/methods.tex`.
- For more complex glossed examples, add a suitable glossing package.
- The list of abbreviations is a simple table and does not require a separate
  glossary-generation step.
- The Estonian sections use the `otherlanguage` environment; the main document
  language is English. For a thesis written entirely in Estonian, adjust the
  main language, chapter titles and the summary in another language.
  Title-page wording can be changed in `metadata.tex` as documented below.
- `sections/abstract.tex` is an optional example, disabled in `main.tex` by
  default. Uncomment its input only if an abstract is needed.
- Appendix references return only the letter: write
  `Appendix~\ref{app:example}` to produce "Appendix A".

## Metadata and supervisors

In `metadata.tex`, add one command per supervisor:

```latex
\thesissupervisor{Prof.}{First supervisor}{University of Tartu}
\thesissupervisor{Dr.}{Second supervisor}{Another institution}
```

Each call adds a person; it does not replace the previous person. Arguments are
academic title, name and institution. No table separators (`&` or `\\`) are
needed. The heading automatically changes from singular to plural. The
publisher can use `\thesisopponent` in the same way; keep its example placeholders
open while writing.

The preferred metadata setters use the `thesis` prefix: `\thesisseriesname`,
`\thesisseriesnumber`, `\thesisissn`, `\thesisisbnprint`, `\thesisisbnpdf`,
`\thesisaccepted`, `\thesisdefencedate`, `\thesisdefencetime`,
`\thesisdefencevenue`, `\thesisyear`, `\thesisdegree` and `\thesisfunding`.
Do not fill publisher-managed values just to compile the template.

The institute declarations remain unchanged. Their prefixed alternatives
(`\thesisinstitute`, `\thesisfaculty`, `\thesisuniversity`) are also available.
Upstream scalar names such as `\ISSN` and `\defensedate` remain aliases for
compatibility. The legacy `\addSup` / `\addOpp` raw-table commands still accept
one call containing all rows, but a repeated call or mixing old and new person
commands now raises an error instead of silently discarding people.

## Customising title-page text

Change wording in `metadata.tex` with `\thesistitlepagetext{key}{text}`;
there is no need to edit the class file. English remains the default.
For example:

```latex
\thesistitlepagetext{supervisor}{Juhendaja}
\thesistitlepagetext{supervisors}{Juhendajad}
\thesistitlepagetext{opponent}{Oponent}
\thesistitlepagetext{opponents}{Oponendid}
\thesistitlepagetext{country}{Eesti}
\thesistitlepagetext{publisher}{Tartu Ülikooli Kirjastus}
\thesistitlepagetext{print}{trükis}
\thesistitlepagetext{acceptance}{%
  Väitekiri on lubatud kaitsmisele \thesisvalue{accepted}.}
\thesistitlepagetext{defence}{%
  Kaitsmine toimub \thesisvalue{defencedate} kell
  \thesisvalue{defencetime}, \thesisvalue{defencevenue}.}
\thesistitlepagetext{copyright}{%
  Autoriõigus \textcopyright\ \thesisvalue{year}, \thesisvalue{author}}
```

Supported text keys are `place`, `country`, `publisher`, `publisherlink`,
`acceptance`, `defence`, `copyright`, `supervisor`, `supervisors`, `opponent`,
`opponents`, `print` and `pdf`. A publisher-link override includes its formatting,
for example `\thesistitlepagetext{publisherlink}{\url{https://tyk.ee/}}`.
Unknown text keys produce a class error.

Use `\thesisvalue{key}` inside sentences to reuse metadata. Value keys are
`author`, `title`, `year`, `degree`, `field`, `institute`, `faculty`, `university`,
`accepted`, `defencedate`, `defencetime`, `defencevenue`, `seriesname`,
`seriesnumber`, `issn`, `isbnprint` and `isbnpdf`. The optional `\thesisfield`
is empty by default; setting it adds the field to the default acceptance sentence.

These are wording examples, not prescribed official formulations; the publisher
finalises the text. For an entirely Estonian thesis, also change the main
language and chapter headings in `main.tex` and the section files.

## Collection-based doctoral thesis

Set `\ThesisType{COLLECTION}` in `main.tex`. All article data is declared
**once in `publications/articles.tex`**. The publication list and article pages
are generated from the same records; do not copy citations into the two
`sections/publications*.tex` rendering files.

Each `\thesisarticle` record has eight fields, in this order:

1. Unique article ID, such as `I` or `II`.
2. Author names.
3. Year.
4. Article title.
5. Publication details, including venue, pages/identifier and DOI; include final punctuation.
6. Author contribution (may be empty).
7. PDF path.
8. Permission or licence statement (may be empty).

Edit the supplied records or add/remove complete records in that one file.
Titles and citations are reused automatically in both locations. Duplicate
article IDs and empty IDs produce a class error. Add the actual article PDFs
at the paths declared in the records, for example `publications/article-1.pdf`.
Missing PDFs still produce clearly labelled demonstration pages.

The two example records are fictional and do not indicate a required number of
articles. No actual articles or PDFs from the original project are included.
This mechanism does not change the thesis's natbib/BibTeX citation system.

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
text-height and spacing settings. The class owns chapter and
counter behaviour; `phdstyle.sty` owns fonts, page geometry and caption formatting.
The class loads `phdstyle` automatically; do not add a separate
`\usepackage{phdstyle}` line to `main.tex`. Headings, lists and contents use the
public interfaces of `titlesec`, `enumitem` and `titletoc` rather than copies of
LaTeX's internal implementations.
Captions explicitly use normal-size text and a colon, preserving the existing output.

Page numbering continues automatically after the title pages, without a
hard-coded starting number. Figures, tables, footnotes and equations in the main
text are numbered continuously; appendix equations use appendix-based numbering.

This is a working example template, not an officially approved institutional
template. The publisher completes the opponent, acceptance and defence details,
dissertation series information and publication identifiers. These fields may
remain as placeholders while the author writes the thesis. The Press's guidance, including a link to a suitable LaTeX template,
is available in its [manuscript preparation guidelines](https://tyk.ee/et/nouded-kasikirjadele).

The formatting rules of the general IEGL's bachelor's and master's thesis
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

## Automatic checks

With Python 3 and `latexmk` installed, run:

```sh
python3 scripts/check_template.py
```

This builds both thesis types in temporary copies and rejects compilation
errors, undefined references/citations and overfull boxes. It also verifies that
the supplied appendix reference is `A` and the main-text equation reference is `1`.
Your selected thesis
type and source files stay unchanged. To retain PDFs and diagnostic logs:

```sh
python3 scripts/check_template.py --output-dir build/checks
```

To use Tectonic instead:

```sh
python3 scripts/check_template.py --engine tectonic
```

Python is needed only for this check script, not for compiling the thesis itself.
The GitHub Actions workflow runs pdfLaTeX/BibTeX checks on pushes and pull
requests for both thesis types. It provides
PDFs and logs as workflow artifacts. Generated files are excluded by `.gitignore`;
source figures and article PDFs remain eligible for version control.

## License

This template adaptation is distributed under the
[Creative Commons Attribution 4.0 International license
(CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/).
The full licence text is included in [LICENSE](LICENSE).

It is based on the UniTartuCS PhD Template, published under
CC BY 4.0. Original authors and contributors are credited above.

Adapted for the Institute of Estonian and General Linguistics,
University of Tartu, by Kristiina Vaik.
