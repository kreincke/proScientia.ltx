#!/bin/bash

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

function cpld {
  DIR=$1

  cp -rd ${DIR} ${PID}/${DIR};

  if [ "${LANG}" == "${EN}" ] ; then
    rm ${PID}/${DIR}/*-${DE}.tex;
  else
    rm ${PID}/${DIR}/*-${EN}.tex;
  fi;

}

if [ -d ${PID} ]; then rm -rf ${PID}; fi

mkdir -p ${PID}/proofs ${PID}/tools
cp -rd extracts snippets ${PID}
cp -rd bib  ${PID}/bib
rm ${PID}/bib/lit.demo.bib ${PID}/bib/lit.test.bib

cpld cfg

if [ "${LANG}" == "${EN}" ] ; then
  cp ${CORE}-en.tex ${PID}/${CORE}.tex
  cp tools/verify-en.tex ${PID}/tools/verify.tex
  cp tools/search-en.tex ${PID}/tools/search.tex
else
  cp ${CORE}-de.tex ${PID}/${CORE}.tex
  cp tools/verify-de.tex ${PID}/tools/verify.tex
  cp tools/search-de.tex ${PID}/tools/search.tex
fi
cp tools/search-with-catalogs.tex ${PID}/tools/
cp tools/Makefile.prjtools ${PID}/tools/Makefile
cat Makefile | sed "s/${CORE}-de.pdf/${CORE}.pdf/" > ${PID}/Makefile
exit 0;
