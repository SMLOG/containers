#!/bin/bash
cd ${REPOS_DIR} || { echo "Failed to enter ${REPOS_DIR} directory"; exit 1; }
for dir in */; do
  if [ -d "$dir/.git" ]; then
    echo "Updating $dir"
    (cd "$dir" && git pull --rebase && echo "Updated $dir" || echo "Failed to update $dir")
  else
    echo "$dir is not a Git repository."
  fi
done
