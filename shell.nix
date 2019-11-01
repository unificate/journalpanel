let pinnedVersion = builtins.fromJSON (builtins.readFile ./nixpkgs-version.json);
    pinnedPkgs = import (builtins.fetchGit {
      inherit (pinnedVersion) url rev;
      ref = "nixos-unstable";
    }) {};
in
with pinnedPkgs;
mkShell {
  buildInputs = [ bundix cacert ruby rubyPackages_2_6.railties ];
}
