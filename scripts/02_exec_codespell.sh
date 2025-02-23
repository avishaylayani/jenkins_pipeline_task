#!/bin/bash

# -------------------------------------------------------------
# This Script runs codespell.
# -------------------------------------------------------------

# Check if the directory $OUTPOT_DIR exists; if not, create a reports directory
if [[ ! -d $OUTPUT_DIR ]]; then
    mkdir $OUTPUT_DIR
fi
##Creating files with typos
echo devic > $APP_DIR/file_with_typos.txt
echo implemen > $APP_DIR/file_with_typos2.txt
echo suppor > $APP_DIR/file_with_typos1.txt

#### Changing ownership of the reports folder, as it's in Volume, it's created with root permissions
sudo chown -R jenkins:jenkins "${OUTPUT_DIR}"

# Initialize the output file with a header
echo "==================" > "${OUTPUT_DIR}/02_codespell_results.md"
echo "CodeSpell Results" >> "${OUTPUT_DIR}/02_codespell_results.md"
echo "==================" >> "${OUTPUT_DIR}/02_codespell_results.md"

# Loop through all directories specified in PATHS_LOCATION and find .sh files
codespell $APP_DIR >> "${OUTPUT_DIR}/02_codespell_results.md"


# Notify the user that the results have been saved
echo "[v] Code Spell Results saved in ${OUTPUT_DIR}/02_codespell_results.md"


