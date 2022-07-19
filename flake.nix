{
  inputs = {
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          env-overlay = self: super: {
            app-env = super.buildEnv {
              name = "app-env";
              paths = with self; [
                nodejs-14_x
                yarn
                purescript
                spago

                libiconv
                zlib
                ruby_3_1

                postgresql_12
              ];
            };
          };

          pkgs = import nixpkgs ({
            inherit system;
            overlays = [
              env-overlay
            ];
          });

        in
        {
          devShell = import ./shell.nix { inherit pkgs; };
        }
      );
}
