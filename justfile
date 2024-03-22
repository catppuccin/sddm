_default:
  @just --list

output_dir := "dist"

# Remove output directory
clean:
  rm -rfv {{output_dir}}

_build flavor:
  # make sure the directories we need exist
  mkdir -p "{{output_dir}}/catppuccin-{{flavor}}"

  # copy the files to the correct location
  cp -r src/* "{{output_dir}}/catppuccin-{{flavor}}"

  # replace the theme name in the metadata file
  sed -i -e "s/%%THEME%%/{{flavor}}/g" "{{output_dir}}/catppuccin-{{flavor}}/metadata.desktop"

  # handle items that are different per theme
  cp "pertheme/{{flavor}}.png" "{{output_dir}}/catppuccin-{{flavor}}/preview.png"
  cp "pertheme/{{flavor}}.conf" "{{output_dir}}/catppuccin-{{flavor}}/theme.conf"

# Build theme
build: clean (_build "latte") (_build "frappe") (_build "macchiato") (_build "mocha")

_zip flavor:
  cd {{output_dir}} ; zip -r catppuccin-{{flavor}}.zip catppuccin-{{flavor}}

# Generate zips
zip: build (_zip "latte") (_zip "frappe") (_zip "macchiato") (_zip "mocha")

# Install themes
install: build
  cp -r {{output_dir}}/catppuccin-* /usr/share/sddm/themes/
