let pinnedVersion = builtins.fromJSON (builtins.readFile ./nixpkgs-version.json);
    pinnedPkgs = import (builtins.fetchGit {
      inherit (pinnedVersion) url rev;
    }) {};
in
with pinnedPkgs;
mkShell {
  buildInputs = [ bundix cacert ruby ];
}
