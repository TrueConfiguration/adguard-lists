#!/bin/bash

# atualiza o branch remoto
/usr/bin/git fetch

# verifica se há alterações no branch local em relação ao branch remoto
if ! /usr/bin/git diff-index --quiet HEAD --; then
  # adiciona todas as alterações
  /usr/bin/git add .

  # adiciona a data atual à mensagem de commit
  commit_message="Updated in $(date +%Y-%m-%d)"

  # cria um commit assinado com a mensagem e a data atual
  /usr/bin/git commit -S -m "$commit_message"

  # envia as alterações para o branch remoto
  /usr/bin/git push
fi

