#!/bin/bash

GEN_DIR='gen/UMLGraph/'
SRC_DIR='src/UMLGraph/'

if [ ! -d $GEN_DIR ]
then
    mkdir -p "$GEN_DIR"
fi

for src_f in "${SRC_DIR}"*.pic
do
    src_base="$(basename $src_f)"
    target="$GEN_DIR""$src_base".svg
    if [ -f "$target" ]
    then
        desc="Overwritten"
    else
        desc="Generated"
    fi
    pic2plot -T svg "$src_f" > "$target"
    echo "$desc $target"
done
