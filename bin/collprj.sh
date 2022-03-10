#!/bin/bash
# This file is part of proScientia.ltx
# (c) 2022 Karsten Reincke (https://github.com/kreincke/proScientia.ltx)
# It is distributed under the terms of the creative commons license
# CC-BY-4.0 (= https://creativecommons.org/licenses/by/4.0/)


DE="de"
EN="en"
LANG=${DE}
CORE="proScientia"
TRASH="trash"

function mhelp {
 echo "collprj.sh [en|de] PRJ";
 exit 0;
}

if [ "$2" == "" ]; then mhelp; fi;

PID=$2

if [ "$1" == "${EN}" ] ||[ "$1" == "EN" ] ; then
  LANG="${EN}";
elif [ "$1" == "${DE}" ] ||[ "$1" == "DE" ] ; then
  LANG="${DE}";
else
  mhelp;
fi

echo "collecting files for project $PID in language $LANG"

if [ -d ${PID} ]; then rm -rf ${PID}; fi

mkdir -p ${PID}/references
cp -rd bib cfg extracts snippets tools ${PID}

if [ "${LANG}" == "${EN}" ] ; then
  find ${PID} -name "*-de.tex" | while read f; do rm $f; done
  cp proScientia-en.tex ${PID}/proScientia.tex
else
  find ${PID} -name "*-en.tex" | while read f; do rm $f; done
  cp proScientia-de.tex ${PID}/${CORE}.tex
fi;

cat Makefile | sed "s/${CORE}-de.pdf/${CORE}.pdf/" > ${PID}/Makefile
exit 0;
