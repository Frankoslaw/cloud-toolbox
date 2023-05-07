{
  inputs = {
    nixpkgs.url      = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url  = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: 
    flake-utils.lib.eachDefaultSystem (system:
      let 
        pkgs = import nixpkgs { inherit system; };
      in
      with pkgs; {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [
            ansible
            ansible-lint
            go-task
            k3sup
            go # For pre-commit
            pre-commit
            gitleaks
            fluxcd
          ];

          NIX_ENFORCE_PURITY = true;
        };
      }
  );
}