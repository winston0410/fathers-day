with (import <nixpkgs> { });

let
  demo = stdenv.mkDerivation {
    name = "fathers-day";
    src = ./.;
    # nativeBuildInputs is for build time dependency
    nativeBuildInputs = [ ninja gcc ];
    # buildInputs is for runtime dependency
    /* buildInputs = [ ninja gcc ]; */
    buildPhase = ''
      ninja
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp my_words $out/bin
    '';
    system = builtins.currentSystem;
  };
in mkShell { buildInputs = [ demo ]; }

