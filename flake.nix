{
  description = "Custom DWM build";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system}.default = pkgs.dwm.overrideAttrs (oldAttrs: {
      patches = [];

      postPatch = ''
      cp ${./config.h} config.h
      '';
    });
  };
}
