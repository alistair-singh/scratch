#!/bin/sh

# scratch.sh
# $<R@t<#
# setup up a project ...from scratch...
# copies scratch folder and replaces scratch tags in files

if [ -z $1 ]; then
  echo 'Usage:'
  echo '  scratch.sh [[projname]] [[type]]'
  echo
  exit 1
fi

scratchdir=~/proj/scratch

projdir=~/proj/$1/
if [ -z $2 ]; then
  projtype=cpp
else
  projtype=$2
fi

if [ ! -d $scratchdir/$projtype ]; then
  echo 'no project template for '$projtype
  exit 1
fi

if [ -d $projdir ]; then
  echo 'already ...exists...'
  exit 1
fi

echo $projdir
mkdir $projdir
cp -R $scratchdir/dsg.sh $projdir
cp -R $scratchdir/$projtype/* $projdir
cp -R $scratchdir/$projtype/.gitignore $projdir

files=$( find $projdir* -type f )
echo $files
sed -e 's/\$<R@t<#projname>/'$1'/g' -i $files

cd $projdir
git init
git add * .gitignore
git commit -m "initial"
echo from scratch ...with love...

