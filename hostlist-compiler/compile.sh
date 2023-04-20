#!/bin/bash

# Define o caminho para o hostlist-compiler
HOSTLIST_COMPILER=hostlist-compiler

# Define os caminhos para as pastas de entrada e saída
CONFIGS_DIR=./configs
COMPILED_DIR=./compiled

# Loop pelos arquivos de configuração na pasta ./configs
for CONFIG_FILE in $CONFIGS_DIR/*.json; do
  # Define o nome do arquivo de output com base no nome do arquivo de configuração
  OUTPUT_FILE=$(basename "$CONFIG_FILE" .json | sed 's/.json//').txt

  # Executa o hostlist-compiler com as opções de configuração e output
  $HOSTLIST_COMPILER -c "$CONFIG_FILE" -o "$COMPILED_DIR/$OUTPUT_FILE"
done
