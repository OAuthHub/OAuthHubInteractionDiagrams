#!/bin/bash

PIC_SRC_DIR='src/UMLGraph/'
WSD_OUTPUT_DIR='src/WSD/'
TRANSP_PATH='utils/pic2wsd.py'

for f in "$PIC_SRC_DIR"*.pic
do
    output_file_path="$WSD_OUTPUT_DIR""$(basename $PIC_SRC_DIR)".wsd
    cat "$f" |\
        python3 "$TRANSP_PATH" > "$output_file_path"
done
