<h1 align="center">
    lrt4cs = [L]aTeX based [R]esearch [T]emplates for [C]lassical [S]cholars
</h1>

<p align="center">
    <a href="https://github.com/kreincke/lrt4cs/commits/" title="Last Commit"><img src="https://img.shields.io/github/last-commit/kreincke/lrt4cs?style=flat"></a>
    <a href="https://github.com/kreincke/lrt4cs/issues" title="Open Issues"><img src="https://img.shields.io/github/issues/kreincke/lrt4cs?style=flat"></a>
    <a href="https://github.com/kreincke/lrt4cs/blob/master/LICENSE" title="License"><img src="https://img.shields.io/badge/License-CC_BY_3.0_DE-blue.svg?style=flat"></a>
</p>

<p align="center">
  <a href="#purpose">Purpose</a> •
  <a href="#use">Use</a> •
  <a href="#structure">Structure</a> •
  <a href="#documentation">Documentation</a> •
  <a href="#contributions">Contributors</a> •
  <a href="#licensing">Licensing</a>
</p>

## Purpose

***lrt4cs*** stands for **L**aTeX based **R**esearch **T**emplates **for** **C**lassical **S**cholars. It offers a set of configuration- and template-files that allow scholars to do humanities research work on the base of *LaTeX*, *Biber*, and *Jabref*. The visible result of these tools, their configuration and their content files follow the style of (German) classical philology, German studies and (German) history.

## Use

These are steps for setting up and using ***lrt4cs*** successfully:

1. Clone the ***lrt4cs*** repository `git clone https://github.com/kreincke/lrt4cs`

2. Select a project identifier *YOURPRJ* that does not contain blanks or slashes.

3. `acquire.sh YOURPRJ [de|en]` :- integrates the string *YOURPRJ* into the files / names that need it, moves the files that do not match the selected localization identifier and all *.git*-files to *trash*

4. `make YOUR-PRJ.pdf` :-

5. `make tools/demo.pdf`

6. `make clean`

7. Edit / update the file *tools/search.tex* in accordance with your needs.

8. `make tools/search.pdf` :-

8. Call *Jabref*. Goto *Preferences/Import preferences* and import *cfg/jabref-biblatex-prefs.xml*. Close *Jabref*.

9. Do your library research work as you planned it in *tools/search.tex*:

  - incorporate the bibliographic data into *bib/lit.main.bib* by using *jabref* or any other text editor
  - create respective excerpts by copying *excerpt/excerpt-tpl.tex* to *excerpt/Bibtexkey.tex*

10. Create your own scientific work by editing *YOUR-PRJ-NAME.tex*, create snippets by copying *snippets/inc.snippet-tpl.tex* to *snippets/inc.YOURCHOICE.tex* and editing it, integrate the snippets by using the LaTeX command `\input{snippets/inc.YOURCHOICE.tex}`

11. Open a shell and type `make YOUR-PRJ.pdf` to create a human readable version of your scientific work.


## Structure

Particularly, ***lrt4cs*** contains files
* to configure LaTeX and Biber in accordance with the style of the classical philology
  - `cfg/inc.cfg-biber-de.tex`
  - `cfg/inc.cfg-biber-en.tex`
* to configure jabref (3.8) in accordance with the style of the classical philology
  - `jabref-biblatex-prefs.xml`
  - `biber-jabref-types.md`
* to integrate an index of abbreviations
  - `cfg/inc.cfg-ncl-de.tex`
  - `cfg/inc.cfg-ncl-en.tex`
  - `cfg/nomencl.ist`
* to overwrite automatically applied hyphenations
  - `cfg/inc.hyphen.tex`

Additionally, ***lrt4cs*** contains tools to support the process of doing the humanities research work:
* `tools/list.tex` prints the complete bibliography as it arises in the final work
* `tools/search.tex` manage search words and tables for documenting the search in libraries
* `tools/verify.tex` allows to verify one set the bibliographic data in different quotation contexts.
* `tools/demo.tex` takes the abstract bibliographic data (*bib/lit.abstr.bib*) and creates a file that showcases all aspects of the (German) classical scholar style.

Finally, ***lrt4cs*** contains
* `bib/lit.main.bib` (= stores the bibliographic data of the secondary literature, can be edited by a respectively configured *jabref* or a plain text editor, is integrated into the final text by the command LaTeX-command `\addbibresource`)
* `bib/lit.abstr.bib` (= store the bibliographic data of abstract secondary literature, can be edited / reviewed by a respectively configured *jabref* or a plain text editor, is used for learning, is added to *demo.tex* for showing all aspects of the (German) classical philology style)
* `bib/ncl.abbreviations.tex` (= stores general abbreviations, can be edited by any text editor, is added by the LaTeX command `\input{bib/ncl.abbreviations.tex}`
)
* `bib/ncl.journals.tex`(= stores journal specific abbreviations, can be edited by any text editor, is added by the LaTeX command `\input{bib/ncl.journals.tex}`
* `snippet/inc.snippet-tpl.tex` (= a template for snippets that can be included into the main work)
* `excerpts/excerpt-tpl.tex` (= a template for excerpting secondary literature that has already been made known to `bib/literature.bib`   )

## Documentation

We decided to apply _English_ as the primary project language although the intended users (= classical scholars) will probably come from German rather than form English speaking countries.

## Contributions

Contributions to *lrt4cs* are welcome. Please use the methods of GitHub to do so. But your contributions also have to be licensed under the *CC BY 3.0 DE*.

## Licensing

Copyright (c) 2020 Karsten Reincke

*lrt4cs* is distributed under the terms of the [**CC BY 3.0 DE**](https://creativecommons.org/licenses/by/3.0/de/) license; you may not use this project except in compliance with that license. The *lrt4cs* repository contains a copy the license '[Creative Commons Namensnennung 3.0 Deutschland](./LICENSE.md)':

You are free to ...

* share (= copy and redistribute the material in any medium or format)
* adapt (= remix, transform, and build upon the material
    for any purpose, even commercially).

*lrt4cs* under the following terms:

* You must give appropriate credit, provide a link to the license, and indicate if changes were made. You may do so in any reasonable manner, but not in any way that suggests the licensor endorses you or your use (= *Attribution*)

* You may not apply legal terms or technological measures that legally restrict others from doing anything the license permits (= *No additional restrictions*)

### Clarifications

Other than the license CC-BY-4.0, CC-BY-3.0 requires to indicate that changes were made only if you create a derivative work of *lrt4cs*. But *lrt4cs* is a set of template files which are intended to be instantiated and reused in the users scientific work. In order to clarify possible questions in advance, we determine the following:

> 1. Instantiating *lrt4cs* files and reusing them in once own (scientific) writing project does not make this writing project a derivative work of *lrt4cs* (hence: you do not have to mark your modifications)  
> 2. But if you distribute a modified version of *lrt4cs* as a non-instantiated set of templates (as you've got it), you must mark your modifications  
> 3. The requirement *to give appropriate credit and provide a link to the license* is can be fulfilled by adding the following hint to your writing project  
>  * Dieser Text wurde mit *lrt4cs* von (c) Karsten Reincke (= https://www.fodina.de/lrt4cs ) erarbeitet, das unter der CC-BY-3.0-DE Lizenz (= https://creativecommons.org/licenses/by/3.0/) distribuiert wird.
>  * This text has been created by using *lrt4cs* of (c) Karsten Reincke (= https://www.fodina.de/lrt4cs ), which has been distributed under the terms of the CC-BY-3.0-DE license (= https://creativecommons.org/licenses/by/3.0/).
