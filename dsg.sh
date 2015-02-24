#!/bin/sh

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
      make run;;
    cpp )
      make run;;
      * )
      echo dont know what to do with "$gear" files :\(
  esac
done
