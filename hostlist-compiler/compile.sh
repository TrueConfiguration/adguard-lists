#!/bin/bash

# Defines path to hostlist-compiler
# NOTE: PATH declarations in crontab are working here, so no need to use full path to binary.
HOSTLIST_COMPILER=hostlist-compiler

# Defines input and output paths
CONFIGS_DIR=./configs
COMPILED_DIR=./compiled

# Loop files in ./configs
for CONFIG_FILE in $CONFIGS_DIR/*.json; do
  # Defines output file names
  OUTPUT_FILE=$(basename "$CONFIG_FILE" .json | sed 's/.json//').txt

  # Runs hostlist-compiler with config and output parameters
  $HOSTLIST_COMPILER -c "$CONFIG_FILE" -o "$COMPILED_DIR/$OUTPUT_FILE"
done
