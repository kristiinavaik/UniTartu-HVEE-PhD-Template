# Eesti ja üldkeeleteaduse instituudi doktoritöö näidismall

LaTeXi näidismall doktoritöö kirjutamiseks ja vormistamiseks.
Põhikeel on inglise keel; eestikeelsed kokkuvõte ja elulookirjeldus on eraldi failides.

## Autorid ja panustajad

See mall põhineb
[TÜ arvutiteaduse instituudi doktoritöö LaTeXi mallil](https://gitlab.cs.ut.ee/unitartucs-thesis-templates/phd-latex-template).

Algse LaTeXi klassi ja malli autor on Reimo Palm, Dmytro Fishman, Novin Shahroudi, Kalmer Apinis, Liisa Rätsep ja Jaak Vilo.

## Instituudipõhine kohandus

Tartu Ülikooli eesti ja üldkeeleteaduse instituudile kohandanud
Kristiina Vaik.

Kohandus hõlmab instituudi andmeid, viitamisseadeid,
puhastatud näiteid ja kasutusjuhendit.

## Kiire algus Overleafis

1. Laadi ZIP-fail Overleafi: New Project > Upload Project.
2. Vali põhifailiks `main.tex` ja kompilaatoriks **pdfLaTeX**.
3. Täida `metadata.tex`: autor, töö pealkirjad ja juhendaja(d).
   Oponentide, kaitsmise ja avaldamise väljad jäta kirjastuse täita.
4. Vali `main.tex` alguses `\ThesisType{MONOGRAPH}` või
   `\ThesisType{COLLECTION}`.
5. Asenda `sections/` failide näidistekst enda tekstiga ja lisa pärisallikad
   faili `bibliographies/references.bib`.
6. Vajuta Recompile. Overleaf käivitab vajaduse korral BibTeXi automaatselt.

Instituudi andmed on juba määratud: **Institute of Estonian and General Linguistics**,
**Faculty of Arts and Humanities**, **University of Tartu**. Need jäävad samaks.
Oponentide, kaitsmise ja avaldamise kohatäitjad jäävad faili `metadata.tex`;
eraldi kirjastuse faili ei ole ning autor ei pea neid välju täitma.

Mõlemad tööliigid kompileeruvad ilma täiendavate pildi- või artiklifailideta.
Failis `commands.tex` saab lisada enda pakette ja käske.

## Failid

| Fail või kaust | Otstarve |
| --- | --- |
| `main.tex` | Tööliik, osade järjekord ja kaasatavad peatükid. |
| `metadata.tex` | Autori ja doktoritöö andmed ning valikuline rahastuse tekst. |
| `commands.tex` | Autori enda lisapaketid ja käsud; lihtne keelenäite keskkond. |
| `phdunitartu.cls` | Tiitellehed, peatükid, numeratsioon ja põhistruktuur. |
| `phdstyle.sty` | Fondid, tekstiala, paketid, viitamine ja abikäsud. |
| `sections/` | Peatükid, kokkuvõte, lisad, elulookirjeldused ja publikatsioonid. |
| `bibliographies/references.bib` | Näidisallikad, mis tuleb asendada pärisallikatega. |
| `figures/` | Autori pildid. |
| `publications/` | Artiklipõhise töö artiklite PDF-id. |

## Sisu muutmine

- Peatüki lisamiseks loo fail ja lisa `main.tex` sisse vastav `\input{sections/nimi}`.
- Osa eemaldamiseks kommenteeri selle `\input` rida välja.
- Nummerdamata peatüki lisamiseks koos sisukorrakirjega kasuta
  `\unnumberedchapter{Pealkiri}`. Ilma sisukorrakirjeta kasuta `\chapter*{Pealkiri}`.
- Põhiteksti pakette ja isiklikke käske lisa faili `commands.tex`.
- Lisa pilt `figures/` kausta ja asenda näidisraam `\includegraphics` käsuga.
- Tabeli, joonise ja nummerdatud keelenäite näited on failis `sections/methods.tex`.
- Keerukamate glossitud näidete jaoks saab autor lisada sobiva glossimispaketi.
- Lühendite loend on lihtne tabel ega vaja eraldi sõnastiku koostamise käsku.
- Eestikeelsed eriosad kasutavad `otherlanguage` keskkonda; teksti põhikeel on inglise.
  Täielikult eestikeelse töö jaoks tuleb muuta põhikeel, peatükkide pealkirjad,
  tiitellehtede sõnastus ja muukeelse kokkuvõtte lahendus.

## Artiklipõhine doktoritöö

Vali `main.tex` failis `\ThesisType{COLLECTION}`. See lisab publikatsioonide
loendi koos panusekirjelduste kohatäitjatega ning artiklite osa.

1. Täida `sections/publications-list.tex`.
2. Täida artiklite kirjed ja õiguste/litsentsi tekstid failis `sections/publications.tex`.
3. Lisa failid `publications/article-1.pdf` ja `publications/article-2.pdf`.
4. Lisa või eemalda artikliplokke vastavalt oma tööle.

Kaks artikliplokki on ainult näited ega väljenda nõutavat artiklite arvu.
Kui PDF puudub, ilmub selle asemel selgelt märgistatud näidislehekülg.
Ühtegi pärisartiklit ega algprojekti PDF-i mallis ei ole.

## Viitamine

Säilitatud on algprojekti `natbib` + `dcu` autor-aasta lahendus ja viite
kirjavahemärkide seaded. Näited: `\citet{examplebook}`,
`\citep{examplearticle}`, `\citep[12--14]{examplebook}`.

Bib-failis olevad kaks kirjet on väljamõeldud ja märgistatud näidisallikatena.
Asenda need enne töö kirjutamist. `dcu` on kompileeruv lähtekoht, mitte kinnitus
vastavusest instituudi võimalikule kohustuslikule viitamisstiilile.
Bibliograafia stiili saab muuta failis `sections/bibliography.tex`.

## Küljendus ja kontrollitavad andmed

Säilitatud on lähteprojekti A4 leht, 11-punktine põhitekst, Timesi-laadne
`mathptmx` font, Helvetica-laadsed pealkirjad, 125 mm laiune tekstiala ning
algprojekti kõrguse ja vahede seaded. Joonise- ja tabeliallkirjade fondi seadistus
on samuti võetud kasutaja projekti põhifailist. Need ei ole BA/MA juhendi seaded.

Tiitellehtede järel jätkub lehekülgede loendus automaatselt, ilma fikseeritud
algusnumbrita. Joonised, tabelid, joonealused märkused ja põhiteksti võrrandid
nummerdatakse läbivalt; lisades kasutatakse võrranditel lisapõhist numbrit.

See on tööks ette valmistatud näidismall, mitte instituudi ametlikult kinnitatud
mall. Oponentide, kaitsmisele lubamise ja kaitsmise info, sarjaandmed ning
avaldamise identifikaatorid täidab kirjastus. Autor võib need kirjutamise ajal
kohatäitjateks jätta. Kirjastuse praegused juhised ja sobiva LaTeXi malli link:
https://tyk.ee/et/nouded-kasikirjadele

Kasutaja antud BA/MA lõputööde üldjuhendi vormistusnõudeid sellesse doktoritöömalli
automaatselt üle ei kantud.

## Kohalik kompileerimine

TeX Live'i või MiKTeX-i olemasolul:

```sh
latexmk -pdf main.tex
```

Ilma latexmk-ta:

```sh
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex
```

## Litsents

See mallikohandus on avaldatud [Creative Commonsi „Autorile viitamine 4.0 Rahvusvaheline“ litsentsi (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/) alusel.

Mall põhineb UniTartuCS doktoritöö mallil, mis on samuti avaldatud CC BY 4.0 litsentsi alusel. Algautorid ja panustajad on nimetatud eespool.

Tartu Ülikooli eesti ja üldkeeleteaduse instituudile kohandanud Kristiina Vaik.
