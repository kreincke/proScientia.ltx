# This file originally comes from 'lrt4cs' [(c) 2020 Karsten Reincke,
# https://www.fodina.de/lrt4cs] that is distributed under the terms
# of CC-BY-3.0-DE (= https://creativecommons.org/licenses/by/3.0/)

#LATEX=latex
LATEX=pdflatex

AUX_EXTS=url bbl blg aux dvi toc log lof nlo nls ilg ils ent out log bcf xml
RES_EXTS=ps pdf

SUBDIRS=snippets tools

default:  lrt4cs-de.pdf

help:
	echo "make | make YOURFILE.pdf"


.SUFFIXES: .tex .dvi .ps .pdf .rtf

.tex.pdf:
	@ echo "### `date +'%Y%m%dT%H%M%S'`"
	@ echo "### converting $< to $@"
	@ $(LATEX) $<
	@ biber `basename $< .tex`
	@ makeindex `basename $< .tex`.nlo -s cfg/nomencl.ist -o `basename $< .tex`.nls
	@ $(LATEX) $<
	@ $(LATEX) $<
	@ $(LATEX) $<
ifneq ($(LATEX),pdflatex)
	@ echo "### converting DVI to PostScript"
	@ dvips $<
	@ echo "### converting PostScript to PDF"
	@ ps2pdf $<
endif
	@ mv $@ `basename $@ .pdf`-`cat cfg/inc.rel.tex`.pdf
	@ make clearAuxFiles

.tex.dvi:
	@ echo "### `date +'%Y%m%dT%H%M%S'`"
	@ echo "### converting $< to $@"
	@ latex $<
	@ bibtex `basename $< .tex`
	@ makeindex `basename $< .tex`.nlo -s cfg/nomencl.ist -o `basename $< .tex`.nls
	@ latex $<
	@ latex $<
	@ latex $<

.dvi.ps:
	@ echo "### `date +'%Y%m%dT%H%M%S'`"
	@ echo "### converting $< to $@"
	@ dvips $<

clearAuxFiles:
	$(foreach EXT, ${AUX_EXTS}, if [ ! "x`ls *.${EXT} 2>/dev/null`" = "x" ]; then rm *.${EXT}; fi;)

clear:	clearAuxFiles

clean:	clearAuxFiles
	$(foreach EXT, ${RES_EXTS}, if [ ! "x`ls *.${EXT} 2>/dev/null`" = "x" ]; then rm *.${EXT}; fi;)

dclear: clear
	$(foreach DIR, ${SUB_DIRS}, cd ${DIR} && make clear && cd ..;)

dclean: clean
	$(foreach DIR, ${SUB_DIRS}, cd ${DIR} && make clear && cd ..;)



