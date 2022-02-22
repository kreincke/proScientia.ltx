<!--
% This file is part of proscientia.ltx
% (c) 2022 Karsten Reincke (https://github.com/kreincke/proscientia.ltx)
% It is distributed under the terms of the creative commons license
% CC-BY-4.0 (= https://creativecommons.org/licenses/by/4.0/)
-->

<p align="center">
    <a href="https://github.com/kreincke/lrt4cs/commits/" title="Last Commit"><img src="https://img.shields.io/github/last-commit/kreincke/lrt4cs?style=flat"></a>
    <a href="https://github.com/kreincke/lrt4cs/issues" title="Open Issues"><img src="https://img.shields.io/github/issues/kreincke/lrt4cs?style=flat"></a>
    <a href="https://github.com/kreincke/lrt4cs/blob/master/LICENSE" title="License"><img src="https://img.shields.io/badge/License-CC_BY_3.0_DE-blue.svg?style=flat"></a>
</p>

<p align="center">
  <a href="#use">Use</a>  
  <a href="#structure">Structure</a>  
  <a href="#prerequisites">Prerequisites</a>  
  <a href="#documentation">Documentation</a>  
  <a href="#contributions">Contributors</a>  
  <a href="#licensing">Licensing</a>
</p>

***lrt4cs*** stands for **L**aTeX based **R**esearch **T**emplates **for** **C**lassical **S**cholars. It offers a set of configuration- and template-files that allow scholars to do humanities research work on the base of *LaTeX*, *BibLaTeX*, *Biber*, and *Jabref*. The visible result of these tools, the respective configuration files and content files follow the style of (German) classical philology, German studies and (German) history.

## Use

For setting up and using ***lrt4cs*** successfully:

1. Clone the ***lrt4cs*** repository `git clone https://github.com/kreincke/lrt4cs` (or download and extract the respective tarball)
2. Open a shell, change into the ***lrt4cs*** directory
3. Configure your system
   * Select a project identifier *YOURPRJ* that does not contain blanks or slashes
   * execute `chmod 755 assimilate.sh`
   * execute `assimilate.sh YOURPRJ [de|en]` =
     - integrates the string *YOURPRJ* into the Makefile
     - renames `ltr4sc-xy.tex` as *YOURPRJ*.tex
     - moves the files that do not match the selected localization identifier into a *trash* directory
     - erases the `.git` directory
     - erases itself
   * execute `make YOUR-PRJ.pdf` = verifies that your system is running
   * `cd tools && make demo-[en|de].pdf` = showcases the features of ***lrt4cs***
   * compare tools/demo-[en|de].pdf with references/tools/demo-[en|de].pdf = should contain the same content
   * execute `make dclean` = deletes all derived files
4. Do your library work
   * Edit / update the file *tools/search.tex* in accordance with your needs.
   * `cd tools && make search.pdf` = create you search report
   * Call *Jabref*. Goto *Preferences/Import preferences* and import *cfg/jabref-biblatex-prefs.xml*. Close *Jabref*.
   * Do your library research work as you planned it in *tools/search.tex*:
      - incorporate the bibliographic data of the secondary literature into *bib/lit.main.bib* by using *jabref* or any other text editor
      - in case of web documents download the pdf files as *references/BIBTEXKEY.pdf*
      - initialize the respective extract by copying *excerpt/excerpt.md* to *excerpt/BIBTEXKEY.md*
      - read and extract the secondary literature
5. Write your work
   * edit / update your frame tex file *YOUR-PRJ-NAME.tex*
   * create your snippets by copying *snippets/inc.snippet.tex* to *snippets/inc.YOURCHOICE.tex* and edit the files
   * integrate the snippets by using the LaTeX command `\input{snippets/inc.YOURCHOICE.tex}`
   * Open a shell and type `make YOUR-PRJ.pdf` to create a human readable version of your scientific work.


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
  - `cfg/inc.babelhyphenations.tex`

Additionally, ***lrt4cs*** contains tools to support the process of doing the humanities research work:
* `tools/list.tex` prints the complete bibliography as it arises in the final work
* `tools/search.tex` manage search words and tables for documenting the search in libraries
* `tools/verify.tex` allows to verify one set the bibliographic data in different quotation contexts.
* `tools/demo.tex` takes the abstract bibliographic data (*bib/lit.abstr.bib*) and creates a file that showcases all aspects of the (German) classical scholar style.

Finally, ***lrt4cs*** contains
* `bib/lit.main.bib` (= stores the bibliographic data of the secondary literature, can be edited by a respectively configured *jabref* or a plain text editor, is integrated into the final text by the command LaTeX-command `\addbibresource`)
* `bib/lit.demo.bib` (= store the bibliographic data of abstract secondary literature, can be used for learning the type fields, is used by *demo-de.tex* and  *demo-en.tex* for showcasing all aspects of the (German) classical philology style)
* `bib/lit.verify.bib` (= contains two entries, is used by *verify-de.tex* and  *verify-en.tex* for creating verification contexts)
* `bib/ncl.abbreviations.tex` (= stores general abbreviations, can be edited by any text editor, is added by the LaTeX command `\input{bib/ncl.abbreviations.tex}`
)
* `bib/ncl.journals.tex`(= stores journal specific abbreviations, can be edited by any text editor, is added by the LaTeX command `\input{bib/ncl.journals.tex}`
* `snippet/inc.snippet-tpl.tex` (= a template for snippets that can be included into the main work)
* `excerpts/excerpt-tpl.tex` (= a template for excerpting secondary literature that has already been made known to `bib/literature.bib`   )

## Prerequisites

*lrt4cs* requires the installation of

* a LaTeX distribution with different packages / programs which should be part of your TeX-Distribution:
  * BibLatex : [https://ctan.org/pkg/biblatex](https://ctan.org/pkg/biblatex)
  * Biber : [https://github.com/plk/biber](https://github.com/plk/biber)
  * biblatex-dw [https://ctan.org/pkg/biblatex-dw](https://ctan.org/pkg/biblatex-dw)
  * Koma-Script : [https://www.ctan.org/pkg/koma-script](https://www.ctan.org/pkg/koma-script)
* bash
* make

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
>  * Erarbeitet mit dem Paket lrt4cs © 2020 K. Reincke (https://fodina.de/lrt4cs), das CC-BY-3.0-DE (https://creativecommons.org/licenses/by/3.0/) lizenziert wurde.
>  * Created by using the package lrt4cs © 2020 K. Reincke (https://fodina.de/lrt4cs) that is CC-BY-3.0-DE licensed (https://creativecommons.org/licenses/by/3.0/)
