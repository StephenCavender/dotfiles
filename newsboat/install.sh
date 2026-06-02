#!/bin/sh
#
# Newsboat
#

# Variables
FILES=(
  "$ZSH/newsboat/config:$HOME/.newsboat/config"
  "$ZSH/newsboat/urls:$HOME/.newsboat/urls"
)

# Iterate over the list of files
for FILE_PAIR in "${FILES[@]}"; do
  # Split the source and destination using ':' as the delimiter
  IFS=":" read -r SOURCE DEST <<< "$FILE_PAIR"

  # Check if the source file exists
  if [ ! -e "$SOURCE" ]; then
    echo "Source file $SOURCE does not exist. Skipping."
    continue
  fi

  ln -sf "$SOURCE" "$DEST"
  if [ $? -eq 0 ]; then
    echo "linked: $DEST -> $SOURCE"
  else
    echo "Failed to link $SOURCE -> $DEST"
  fi
done

exit 0
