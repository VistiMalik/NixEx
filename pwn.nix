{
  description = "ctf symlink test";

  outputs = { self, nixpkgs ? import <nixpkgs> {} }:
    let
      system = "x86_64-linux";
    in {
      packages.${system}.pwn = with nixpkgs.legacyPackages.${system}; stdenv.mkDerivation {
        pname = "pwn-symlink";
        version = "1.0";
        src = null;
        buildPhase = ''
          mkdir -p $out
          # create a symlink named "flag.txt" pointing to /flag.txt (on the builder)
          ln -s /flag.txt $out/flag.txt
        '';
        installPhase = ''
          # nothing else
        '';
      };
    };
}
