_default:
  @just --list

output_dir := "dist"
themes := "THEMES=\"mocha macchiato frappe latte\""

# Remove output directory
clean:
  rm -rfv {{output_dir}}

# Build theme
build: clean
  #!/usr/bin/env sh

  {{themes}}

  for THEME in $THEMES; do
  # make sure the directories we need exist
  mkdir -p "{{output_dir}}/catppuccin-$THEME"

  # copy the files to the correct location
  cp -r src/* "{{output_dir}}/catppuccin-$THEME"

  # replace the theme name in the metadata file
  sed -i -e "s/%%THEME%%/$THEME/g" "{{output_dir}}/catppuccin-$THEME/metadata.desktop"

  # handle items that are diffrent per theme
  cp "pertheme/$THEME.png" "{{output_dir}}/catppuccin-$THEME/preview.png"
  cp "pertheme/$THEME.conf" "{{output_dir}}/catppuccin-$THEME/theme.conf"
  done

# Generate zips
zip: build
  #!/usr/bin/env sh

  {{themes}}

  for THEME in $THEMES; do
  zip -r {{output_dir}}/catppuccin-$THEME.zip {{output_dir}}/catppuccin-$THEME
  done

# Install themes
install: build
  sudo cp -r {{output_dir}}/catppuccin-* /usr/share/sddm/themes/
