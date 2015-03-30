#!/bin/bash

PIC_SRC_DIR='src/UMLGraph/'
TRANSP_PATH='utils/pic2wsd.py'

WSD_OUTPUT_DIR='src/WSD/'
if [ ! -d "$WSD_OUTPUT_DIR" ]
then
    mkdir -p "$WSD_OUTPUT_DIR"
fi

for f in "$PIC_SRC_DIR"*.pic
do
    echo "Dealing with --------> ${f}..."
    output_file_path="$WSD_OUTPUT_DIR""$(basename $f)".wsd
    cat "$f" | python3 "$TRANSP_PATH" > "$output_file_path"
    echo "Generated/Overwritten: $output_file_path"
done
