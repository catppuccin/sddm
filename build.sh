#!/bin/sh

THEMES="mocha macchiato frappe latte"

for THEME in $THEMES; do
  # make sure the directories we need exist
  mkdir -p "/tmp/ctp-sddm/$THEME" "/tmp/ctp-sddm/dist"

  # copy the files to the correct location
  cp -r src/* "/tmp/ctp-sddm/$THEME"

  # replace the theme name in the metadata file
  sed -i -e "s/%%THEME%%/$THEME/g" "/tmp/ctp-sddm/$THEME/metadata.desktop"

  # handle items that are diffrent per theme
  cp "perTHEME/$THEME.png" "/tmp/ctp-sddm/$THEME/preview.png"
  cp "perTHEME/$THEME.conf" "/tmp/ctp-sddm/$THEME/theme.conf"

  # if any arguments are passed, dont zip the files
  if [ -z "$1" ]; then
    cd /tmp/ctp-sddm || exit
    zip -r "/tmp/ctp-sddm/dist/$THEME.zip" "$THEME"
    cd - || exit
  else
    cp -r "/tmp/ctp-sddm/$THEME" "/tmp/ctp-sddm/dist"
  fi
done

cp -r /tmp/ctp-sddm/dist ./
