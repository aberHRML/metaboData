{
  description = "R development environment with tidyverse";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

    R-packages = with pkgs.rPackages; [
      # add R packages here
      covr
      devtools
      DT
      knitr
      piggyback
      prettydoc
      rmarkdown
      spelling
      tidyverse
      usethis
      yaml
    ];

    r = pkgs.rWrapper.override {
      packages = R-packages;
    };

    radian = pkgs.radianWrapper.override {
      packages = R-packages;
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        r
        radian
        texliveSmall
        pandoc
      ];
    };
  };
}
