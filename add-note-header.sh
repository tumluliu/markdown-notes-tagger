#!/usr/bin/env bash
NOTES_PATH=$1
find $NOTES_PATH -type f -name "*.md" -print0 | while IFS= read -r -d '' file; do
  echo "Adding tags to $file ..."
  filename=$(basename -- "$file")
  title="${filename%.*}"
  notebook="$(basename "$(dirname "$(realpath "$file")")")"
  mtime=$(date -r "$file" --iso-8601=seconds)
  ctime=$mtime
  TAGS="tags: [Notebooks/$notebook]"
  TITLE="title: $title"
  CREATED="created: '$ctime'"
  MODIFIED="modified: '$mtime'"
  touch -r "$file" timestamp
  echo -e "---\n" | cat - "$file" > temp && mv temp "$file"
  echo $MODIFIED | cat - "$file" > temp && mv temp "$file"
  echo $CREATED | cat - "$file" > temp && mv temp "$file"
  echo $TITLE | cat - "$file" > temp && mv temp "$file"
  echo $TAGS | cat - "$file" > temp && mv temp "$file"
  echo "---" | cat - "$file" > temp && mv temp "$file"
  touch -r timestamp "$file"
  echo done.
done
rm timestamp