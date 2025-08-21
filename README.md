# Rofi-Music
Bash script using rofi (choose-gui) menu to play local music on macOS.

# Preview
<img width="450" height="450" alt="image" src="https://github.com/FlutterKafka/Rofi-Music/blob/main/assets/rofi-music.png" />

# Planned Improvements
- [ ] Make cross-platform (notify-send for linux)

# Installation
### Using NixOS/Nix-Darwin
#### Via Nix Run (Ephemeral)
``` fish
nix run github:FlutterKafka/Rofi-Music
```
###### You can attach this to skhd to run this script without having to install any dependencies.
``` fish
cmd - p : nix run github:FlutterKafka/Rofi-Music
```
#### Via Nix Flakes
``` nix
rofi-music.url = "github:FlutterKafka/Rofi-Music";
```
###### Then add it to your system or home-manager configuration.
``` nix
inputs.rofi-music.packages.${pkgs.system}.default
```

### Using Homebrew
Install [Homebrew](https://brew.sh/)
``` fish
brew install choose-gui terminal-notifier mpv
```
###### Once the dependencies are installed, then clone the repo and give the script execute permissions.
``` fish
git clone https://github.com/FlutterKafka/Rofi-Music.git && \
cd Rofi-Music && \
chmod +x rofi-music
```
###### Now you should be able to run the script.
``` fish
./rofi-music
```

# Credits
The idea and framework for this script came from:
* [Carbon-Bl4ck/Rofi-Beats](https://github.com/Carbon-Bl4ck/Rofi-Beats)

# License
This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for more details.
