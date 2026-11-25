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

1. Vali GitHubis **Code > Download ZIP** ning laadi saadud ZIP-fail Overleafi: New Project > Upload Project.
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
| `publications/` | Artiklite PDF-id ja ühine andmefail `articles.tex`. |

## Sisu muutmine

- Peatüki lisamiseks loo fail ja lisa `main.tex` sisse vastav `\input{sections/nimi}`.
- Osa eemaldamiseks kommenteeri selle `\input` rida välja.
- Nummerdamata peatüki lisamiseks koos sisukorrakirjega kasuta
  `\unnumberedchapter{Pealkiri}`. Ilma sisukorrakirjeta kasuta `\chapter*{Pealkiri}`.
- Põhiteksti pakette ja isiklikke käske lisa faili `commands.tex`. See loetakse
  sisse enne `hyperref`-i, seega saab sinna panna ka paketid, mis peavad
  laadima enne `hyperref`-i.
- Lisa pilt `figures/` kausta ja asenda näidisraam `\includegraphics` käsuga.
- Tabeli, joonise ja nummerdatud keelenäite näited on failis `sections/methods.tex`.
- Keerukamate glossitud näidete jaoks saab autor lisada sobiva glossimispaketi.
- Lühendite loend on lihtne tabel ega vaja eraldi sõnastiku koostamise käsku.
- Eestikeelsed eriosad kasutavad `otherlanguage` keskkonda; teksti põhikeel on inglise.
  Täielikult eestikeelse töö jaoks tuleb muuta põhikeel, peatükkide pealkirjad,
  muukeelse kokkuvõtte lahendus. Tiitellehe tekste saab muuta allpool
  kirjeldatud viisil failis `metadata.tex`.
- `sections/abstract.tex` on valikuline näide, mis on vaikimisi failis `main.tex`
  välja lülitatud. Vajaduse korral eemalda sisestusrea eest `%`.
- Lisaviide annab ainult tähe: kirjuta `Appendix~\ref{app:example}`,
  et saada „Appendix A”.

## Metaandmed ja juhendajad

Lisa failis `metadata.tex` iga juhendaja kohta eraldi käsk:

```latex
\thesissupervisor{Prof.}{Esimene juhendaja}{University of Tartu}
\thesissupervisor{Dr.}{Teine juhendaja}{Teine asutus}
```

Iga käsk lisab inimese, mitte ei asenda eelmist. Argumendid on ametinimetus,
nimi ja asutus. Tabeli eraldajaid (`&` või `\\`) pole vaja kirjutada.
Pealkiri muutub ühelt juhendajalt mitmele automaatselt. Kirjastus saab samal
viisil kasutada käsku `\thesisopponent`; kirjutamise ajal jäta oponendi
näidisväljad kohatäitjateks.

Eelistatud metaandmekäskudel on ühtne `thesis`-eesliide: `\thesisseriesname`,
`\thesisseriesnumber`, `\thesisissn`, `\thesisisbnprint`, `\thesisisbnpdf`,
`\thesisaccepted`, `\thesisdefencedate`, `\thesisdefencetime`,
`\thesisdefencevenue`, `\thesisyear`, `\thesisdegree` ja `\thesisfunding`.
Kirjastuse välju ei pea kompileerimiseks täitma.

Instituudi deklaratsioonid jäävad samaks. Olemas on ka eesliitega variandid
`\thesisinstitute`, `\thesisfaculty` ja `\thesisuniversity`. Vanad skalaarsete
andmete käsud, näiteks `\ISSN` ja `\defensedate`, töötavad ühilduvuse jaoks
aliaste kaudu. Vanad `\addSup` / `\addOpp` käsud lubavad ühte kutset, mis
sisaldab kõiki tabeliridu. Korduv kutse või vana ja uue isikukäsu segamine annab
nüüd vea ega kirjuta inimesi vaikselt üle.

## Tiitellehe tekstide seadistamine

Muuda sõnastust failis `metadata.tex` käsuga `\thesistitlepagetext{võti}{tekst}`.
Klassifaili pole vaja muuta. Vaikimisi säilib ingliskeelne tekst. Näiteks:

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

Toetatud tekstivõtmed on `place`, `country`, `publisher`, `publisherlink`,
`acceptance`, `defence`, `copyright`, `supervisor`, `supervisors`, `opponent`,
`opponents`, `print` ja `pdf`. Kirjastuse lingi väärtus sisaldab vormindust,
näiteks `\thesistitlepagetext{publisherlink}{\url{https://tyk.ee/}}`.
Tundmatu tekstivõti annab klassivea.

Kasuta lausetes metaandmete taaskasutamiseks `\thesisvalue{võti}`. Andmevõtmed
on `author`, `title`, `year`, `degree`, `field`, `institute`, `faculty`,
`university`, `accepted`, `defencedate`, `defencetime`, `defencevenue`,
`seriesname`, `seriesnumber`, `issn`, `isbnprint` ja `isbnpdf`. Valikuline
`\thesisfield` on vaikimisi tühi; selle määramine lisab eriala vaikimisi
kaitsmisele lubamise lausesse.

Need on sõnastusnäited, mitte kohustuslikud ametlikud tekstid; lõpliku sõnastuse
määrab kirjastus. Täielikult eestikeelse töö jaoks muuda ka põhikeel ning
peatükkide pealkirjad failis `main.tex` ja sisufailides.

## Artiklipõhine doktoritöö

Vali `main.tex` alguses `\ThesisType{COLLECTION}`. Kõik artikliandmed määratakse
**ühe korra failis `publications/articles.tex`**. Sama kirje põhjal koostatakse
nii publikatsiooniloend kui ka artiklilehed. Ära kopeeri viitekirjeid kahte
`sections/publications*.tex` vormistusfaili.

Igal `\thesisarticle` kirjel on järgmises järjekorras kaheksa välja:

1. Kordumatu artiklitähis, näiteks `I` või `II`.
2. Autorid.
3. Aasta.
4. Artikli pealkiri.
5. Ilmumisandmed, sh väljaanne, leheküljed/identifikaator ja DOI koos lõpp-punktiga.
6. Autori panus (võib olla tühi).
7. PDF-faili asukoht.
8. Loa või litsentsi tekst (võib olla tühi).

Muuda näidiskirjeid või lisa/eemalda terveid kirjeid samas failis. Pealkiri ja
viitekirje jõuavad automaatselt mõlemasse kohta. Korduv või tühi artiklitähis
annab klassivea. Lisa tegelikud PDF-id kirjetes määratud asukohta, näiteks
`publications/article-1.pdf`. Puuduva PDF-i asemel jääb alles märgistatud näidisleht.

Kaks kaasasolevat kirjet on väljamõeldud näited, mitte nõutav artiklite arv.
Pärisartikleid ega algprojekti PDF-e mallis ei ole. See lahendus ei muuda
põhiteksti natbib/BibTeXi viitamissüsteemi.

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
Klass haldab peatükke ja numeratsiooni; `phdstyle.sty` haldab fonte, tekstiala
ja allkirjade vormingut. Klass laadib `phdstyle` automaatselt; faili `main.tex`
pole vaja eraldi `\usepackage{phdstyle}` rida. Pealkirju, loendeid ja sisukorda
seadistatakse pakettide `titlesec`, `enumitem` ja `titletoc` avalike käskudega,
mitte LaTeXi sisemiste käskude koopiatega. Allkirjadel on selgelt määratud tavasuuruses tekst ja
koolon, säilitades olemasoleva väljundi.

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

Tectonicuga:

```sh
tectonic main.tex
```

Mall ei vaja `minted` paketti, shell-escape'i, Pythonit ega eraldi
`glossaries`-protsessi.

## Automaatsed kontrollid

Python 3 ja `latexmk` olemasolul käivita:

```sh
python3 scripts/check_template.py
```

Skript kompileerib mõlemad tööliigid ajutistes koopiates ning kontrollib vigu,
lahendamata viiteid ja veerisest välja ulatuvaid tekstikaste. Samuti kontrollib see,
et näidislisa viide oleks `A` ja põhiteksti näidisvõrrandi viide `1`. Tööliigi valik
ja lähtefailid jäävad muutmata. PDF-ide ja logide säilitamiseks kasuta:

```sh
python3 scripts/check_template.py --output-dir build/checks
```

Tectonicuga kontrollimiseks:

```sh
python3 scripts/check_template.py --engine tectonic
```

Pythonit vajab ainult kontrollskript, mitte doktoritöö kompileerimine ise.
GitHub Actions kontrollib push'ide ja pull request'ide korral pdfLaTeXi/BibTeXiga
mõlemat tööliiki. PDF-id ja logid on
kättesaadavad töövoo artefaktidena. `.gitignore` jätab genereeritud failid
versioonihaldusest välja; lähtejooniseid ja artiklite PDF-e see ei välista.

## Litsents

See mallikohandus on avaldatud [Creative Commonsi „Autorile viitamine 4.0 Rahvusvaheline“ litsentsi (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/) alusel.
Litsentsi täielik tekst on failis [LICENSE](LICENSE).

Mall põhineb UniTartuCS doktoritöö mallil, mis on samuti avaldatud CC BY 4.0 litsentsi alusel. Algautorid ja panustajad on nimetatud eespool.

Tartu Ülikooli eesti ja üldkeeleteaduse instituudile kohandanud Kristiina Vaik.
