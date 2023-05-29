#!/bin/bash

# NOTE: For some reason this script is not inheriting the git location from the
# PATH declarations in crontab, so I'm using full path for the binary. If used
# in another instance/machine, it may be required to manually update paths.

# Fetch remote
/usr/bin/git fetch 

# Check for local changes
if ! /usr/bin/git diff-index --quiet HEAD --; then
  # Add local changes
  /usr/bin/git add .

  # Set commit message
  commit_message="Updated in $(date +%Y-%m-%d)"

  # Commit changes
  /usr/bin/git commit -S -m "$commit_message"

  # Push changes
  /usr/bin/git push
fi
