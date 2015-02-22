#!/bin/sh

while true; do
  gear=$( inotifywait -q --format %w%f -r -e close_write,moved_to . )
  if [ "$gear" = "./dsg.sh" ]; then 
    clear
    echo oil changed... :\)
    exec ./dsg.sh
  fi

  gear=${gear##*.}
  echo $gear

  case $gear in
    /Makefile )
      make run;;
    cpp )
      make run;;
      * )
      echo dont know what to do with "$gear" files :\(
  esac
done
