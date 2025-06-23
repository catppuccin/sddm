_default:
  @just --list

build:
  #!/usr/bin/env bash 
  rm -r ./themes
  for template in $(ls ./templates/*); do
    echo $template
    whiskers $template
  done
  for flavor in $(whiskers --list-flavors -o plain ); do
    for accent in $(whiskers --list-accents -o plain ); do
      cp -r ./src/* ./themes/catppuccin-$flavor-$accent/
      if [ $flavor == "latte" ]; then 
        cp ./assets/defaultIconLight.png ./themes/catppuccin-$flavor-$accent/assets/defaultIcon.png
      else
        cp ./assets/defaultIcon.png ./themes/catppuccin-$flavor-$accent/assets/defaultIcon.png 
      fi
    done
  done
  
