#!/usr/bin/env bash

# Copy version controlled githooks to local hooks directory for invocation

git_root() {
  git rev-parse --show-toplevel
}

src="$(git_root)/githooks"
dest="$(git_root)/.git/hooks"

for file in "$src"/*
do
  f=$(basename "$file")

  echo "Copying $file to $dest"
  cp -a "$file" "$dest"

  echo "Making $f executable"
  chmod a+x "$dest/$f"
done


