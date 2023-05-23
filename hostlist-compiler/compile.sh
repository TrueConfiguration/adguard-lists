#!/bin/bash

# Defines path to hostlist-compiler
# NOTE: PATH declarations in crontab are working here, so no need to use full path to binary.
HOSTLIST_COMPILER=hostlist-compiler

# Defines input and output paths
CONFIGS_DIR=./configs
COMPILED_DIR=./compiled
TEMP_DIR=./temp

# Checks if ./temp exists, hostlist-compiler will fail otherwise.

if [ ! -d "$TEMP_DIR" ]; then
    mkdir "$TEMP_DIR"
fi

# Loop files in ./configs
for CONFIG_FILE in $CONFIGS_DIR/*.json; do
  # Defines output file names
  OUTPUT_FILE=$(basename "$CONFIG_FILE" .json | sed 's/.json//').txt

  # Runs hostlist-compiler with config and output parameters
  $HOSTLIST_COMPILER -c "$CONFIG_FILE" -o "$TEMP_DIR/$OUTPUT_FILE"
done

# Loop files in ./temp
for file in "$TEMP_DIR"/*; do
  filename=$(basename "$file")

  # Checks if file already existis in ./compiled
  if [ -e "$COMPILED_DIR/$filename" ]; then
    # Compares files in ./temp and ./compiled
    diff_output=$(diff "$file" "$COMPILED_DIR/$filename")

    # Counts diff lines (because hostlist-compiler will always update created date to match fetch date)
    num_lines_diff=$(echo "$diff_output" | sed -n '/^[0-9]/p' | wc -l)

    # Checks if there is more than one line updated (date line)
    if [ "$num_lines_diff" -gt 1 ]; then
      cp "$file" "$COMPILED_DIR/$filename"
      echo "The file $filename was copied to compiled folder."
    fi
  else
    # If file doesn't exist, creates
    cp "$file" "$COMPILED_DIR/$filename"
    echo "The file $filename was created in compiled folder."
  fi
done
