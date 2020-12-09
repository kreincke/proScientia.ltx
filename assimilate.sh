#!/bin/bash


DE="de"
EN="en"
UNUSED_LANGUAGE=$EN
CORE="lrt4cs"
TRASH="trash"

function mhelp {
 echo "acquire.sh [en|den] PRJ";
 exit 0;
}

if [ "$2" == "" ]; then mhelp; fi;

PID=$2

if [ "$1" == "${EN}" ]; then 
  UNUSED_LANGUAGE="${DE}"; 
elif [ "$1" == "${DE}" ]; then
  UNUSED_LANGUGAE="${EN}"; 
else
  mhelp; 
fi

ULV="${UNUSED_LANGUAGE}\."

function isInfix {
  DE=`echo "$1" | grep "$2"`;
  if [ "$DE" == "$1" ]; then 
    true 
  else 
    false 
  fi;
}

mkdir -p $TRASH

find . -type f | grep -v "\.git" | while read f; do  if isInfix $f $ULV; then mv $f $TRASH; fi; done

if [ -e ${CORE}-de.tex ]; then mv ${CORE}-de.tex $PID.tex; fi
if [ -e ${CORE}-en.tex ]; then mv ${CORE}-en.tex $PID.tex; fi

cat Makefile | sed "s/default: *lrt4cs\-../default: $PID/" > x.x;
mv x.x Makefile;

rm -rf .git
rm $0

