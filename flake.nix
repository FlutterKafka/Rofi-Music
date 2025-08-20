{
  description = "Bash script using rofi (choose-gui) to play local music on macOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    rofi-music-src = {
      url = "github:FlutterKafka/Rofi-Music";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, flake-utils, rofi-music-src }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          name = "rofi-music";
          src = rofi-music-src;

          buildInputs = with pkgs; [
            mpv
            choose-gui
            terminal-notifier
          ];

          installPhase = ''
            mkdir -p $out/bin
            cp rofi-music $out/bin/
            chmod +x $out/bin/rofi-music
          '';

          meta = with pkgs.lib; {
            description = "Bash script using rofi (choose-gui) to play local music on macOS";
            homepage = "https://github.com/FlutterKafka/Rofi-Music";
            license = licenses.mit;
            maintainers = [ "FlutterKafka" ];
          };
        };

        apps.default = {
          type = "app";
          program = "${self.packages.${system}.default}/bin/rofi-music";
        };
      }
    );
}
