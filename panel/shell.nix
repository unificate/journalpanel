let pinnedVersion = builtins.fromJSON (builtins.readFile ../nixpkgs-version.json);
    pinnedPkgs = import (builtins.fetchGit {
      inherit (pinnedVersion) url rev;
      ref = "nixos-unstable";
    }) {};
in
with pinnedPkgs;
let gems = bundlerEnv {
      name = "hello_rails-env";
      inherit ruby;
      gemdir = ./.;
    };
in
mkShell {
  buildInputs = [ bundix cacert firefox geckodriver libxml2 gems nodejs ruby yarn zlib ];
}
