#!/bin/sh

# scratch.sh
# $<R@t<#
# setup up a project ...from scratch...
# copies scratch folder and replaces scratch tags in files

if [ -z $1 ]; then
  echo 'Usage:'
  echo '  scratch.sh [[projname]]'
  echo
  exit 1
fi

projdir=~/proj/$1/

if [ -d $projdir ]; then
  echo 'already ...exists...'
  exit 1
fi

echo $projdir
mkdir $projdir
cp -R ~/proj/scratch/* $projdir
sed -e 's/\$<R@t<#projname>/'$1'/g' -i $( find $projdir/* )

cd $projdir
git init
echo from scratch ...with love...

