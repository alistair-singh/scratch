#!/bin/sh

# dsg.sh
# double clutching auto build

num=-1
while true; do
  gear=$( inotifywait -q --format %w%f -r -e close_write,moved_to . )
  clear
  if [ "$gear" = "./dsg.sh" ]; then 
    echo oil changed... :\)
    exec ./dsg.sh
  fi

  gear=${gear##*.}
  case $gear in
    /Makefile )
      make test;;
    cpp )
      make test;;
      * )
      echo dont know what to do with \"$gear\" files :\(
      num=$(( $num-1 ))
  esac
  echo $num
  num=$(( $num+1 ))
done
