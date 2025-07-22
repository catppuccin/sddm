_default:
  @just --list

clean:
  rm -rf ./themes ./zips

build: clean
  #!/usr/bin/env bash
  for template in $(find ./templates -type f -name "*.tera"); do
    whiskers $template
  done
  for flavor in $(whiskers --list-flavors -o plain); do
    for accent in $(whiskers --list-accents -o plain); do
      cp -r ./src/* ./themes/catppuccin-$flavor-$accent/
      if [ $flavor == "latte" ]; then
        cp ./assets/defaultIconLight.png ./themes/catppuccin-$flavor-$accent/assets/defaultIcon.png
      else
        cp ./assets/defaultIcon.png ./themes/catppuccin-$flavor-$accent/assets/defaultIcon.png
      fi
      cp ./assets/$flavor.png ./themes/catppuccin-$flavor-$accent/preview.png
    done
  done

zip: build
  #!/usr/bin/env bash
  mkdir -p zips
  for dir in ./themes/*; do
    [ -e "$dir/theme.conf" ] || continue
    theme_name="$(basename "$dir")"
    (cd "$dir" && zip -r "../../zips/${theme_name}-sddm" .)
  done
