<h3 align="center">
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/logos/exports/1544x1544_circle.png" width="100" alt="Logo"/><br/>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
	Catppuccin for <a href="https://github.com/sddm/sddm/">SDDM</a>
	<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/misc/transparent.png" height="30" width="0px"/>
</h3>

<p align="center">
    <a href="https://github.com/catppuccin/sddm/stargazers"><img src="https://img.shields.io/github/stars/catppuccin/sddm?colorA=363a4f&colorB=b7bdf8&style=for-the-badge"></a>
    <a href="https://github.com/catppuccin/sddm/issues"><img src="https://img.shields.io/github/issues/catppuccin/sddm?colorA=363a4f&colorB=f5a97f&style=for-the-badge"></a>
    <a href="https://github.com/catppuccin/sddm/contributors"><img src="https://img.shields.io/github/contributors/catppuccin/sddm?colorA=363a4f&colorB=a6da95&style=for-the-badge"></a>
</p>

<p align="center">
  <img src="assets/preview.webp"/>
</p>

## Previews

<details>
<summary>🌻 Latte</summary>
<img src="assets/latte.webp"/>
</details>
<details>
<summary>🪴 Frappé</summary>
<img src="assets/frappe.webp"/>
</details>
<details>
<summary>🌺 Macchiato</summary>
<img src="assets/macchiato.webp"/>
</details>
<details>
<summary>🌿 Mocha</summary>
<img src="assets/mocha.webp"/>
</details>

## Usage

1. Ensure you have the [dependencies](#dependencies).
2. Get your preferred theme from the [releases page](https://github.com/catppuccin/sddm/releases).
3. Unzip the contents of the release into `/usr/share/sddm/themes/`
4. Edit the file `/etc/sddm.conf` and change the theme in there to `catppuccin-<flavour>`. For example, `catppuccin-mocha`.

- If you don't have this file make one with `.conf` extension and make sure it has these two lines within the config:

```
[Theme]
Current=catppuccin-flavour
```

## Dependencies

### Arch Based OS

```bash
pacman -Syu qt6-svg qt6-declarative qt5-quickcontrols2
```

### Debian Based OS

```bash
apt install --no-install-recommends qml-module-qtquick-layouts qml-module-qtquick-controls2 libqt6svg6
```

### RPM Based OS

```bash
dnf install qt6-qtquickcontrols2 qt6-qtsvg
```

### Solus OS

```bash
eopkg install qt6-quickcontrols2 qt6-svg
```

### NixOS

This theme is available in nixpkgs [`catppuccin-sddm`](https://github.com/NixOS/nixpkgs/blob/master/pkgs/by-name/ca/catppuccin-sddm/package.nix).

Add the package to systemPackages, you can customize the theme by overriding the attributes:

```nix
environment.systemPackages = [(
  pkgs.catppuccin-sddm.override {
    flavor = "mocha";
    font  = "Noto Sans";
    fontSize = "9";
    background = "${./wallpaper.png}";
    loginBackground = true;
  }
)];
```

Then set it as the theme in the sddm configuration, change the suffix to the flavor you set in the package override:

```nix
displayManager.sddm = {
  enable = true;
  theme = "catppuccin-mocha";
  package = pkgs.kdePackages.sddm;
};
```

## Configuration

- `Font`: The chosen font
- `FontSize`: The text size
- `ClockEnabled`: Whether the clock is on or off, this should be set to either `true` or `false`
- `CustomBackground`: When this is `true` it will read from `Background` to render the custom background image, this should be set to either `true` or `false`
- `Background`: This is the location of the background image, it is recomended to use the provided `backgrounds/` directory to store the images
- `LoginBackground`: This is a extra background around the login panel, this should be set to either `true` or `false`
- `UserIcon`: When this is set to `true` the user icon will be displayed, this should be set to either `true` or `false`
- `AccentColor`: The color of the login button, this should be the hex code of one of the palette colors

## 💝 Thanks to

- [DonutDev](https://github.com/DonutDev)
- [Isabelinc](https://github.com/Isabelincorp)
- [Isabel Roses](https://github.com/isabelroses)

&nbsp;

<p align="center"><img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/footers/gray0_ctp_on_line.svg?sanitize=true" /></p>
<p align="center">Copyright &copy; 2021-present <a href="https://github.com/catppuccin" target="_blank">Catppuccin Org</a>
<p align="center"><a href="https://github.com/catppuccin/catppuccin/blob/main/LICENSE"><img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=License&message=MIT&logoColor=d9e0ee&colorA=363a4f&colorB=b7bdf8"/></a></p>
