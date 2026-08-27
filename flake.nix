{
  description = "C'est Moi, my about me page";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = {nixpkgs, ...}: let
    supportedSystems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
  in {
    packages = forAllSystems (
      system: let
        pkgs = import nixpkgs {inherit system;};

        site = pkgs.stdenv.mkDerivation {
          name = "my-about-site";
          src = ./.;

          nativeBuildInputs = [pkgs.ndg];

          buildPhase = ''
            mkdir -p $out
            ndg html --input-dir src --output-dir $out --title "About Me"
          '';
          dontInstall = true;
        };

        dockerImage = pkgs.dockerTools.buildLayeredImage {
          name = "my-markdown-page";
          tag = "latest";
          contents = [pkgs.darkhttpd site];
          config = {
            Cmd = ["darkhttpd" "${site}" "--port" "80"];
            ExposedPorts = {"80/tcp" = {};};
          };
        };
      in {
        html = site;
        default = dockerImage;
      }
    );

    devShells = forAllSystems (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        default = pkgs.mkShell {
          packages = with pkgs; [
            ndg
            darkhttpd
            watchexec
          ];
        };
      }
    );
  };
}
