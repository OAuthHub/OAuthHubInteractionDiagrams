#!/bin/bash

GEN_DIR='gen/UMLGraph/'

if [ ! -d $GEN_DIR ]
then
    mkdir -p "$GEN_DIR"
fi

for f in *.pic
do
    target="$GEN_DIR""$f".svg
    if [ -f "$target" ]
    then
        desc="Overwritten"
    else
        desc="Generated"
    fi
    pic2plot -T svg "$f" > "$target"
    echo "$desc ${GEN_DIR}${f}"
done
