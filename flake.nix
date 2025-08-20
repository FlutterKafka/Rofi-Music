{
  description = "Bash script using rofi (choose-gui) to play local music on macOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.default = pkgs.stdenv.mkDerivation {
        name = "rofi-music";
        src = self;

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

      apps.${system}.default = {
        type = "app";
        program = "${self.packages.${system}.default}/bin/rofi-music";
      };
    };
}
