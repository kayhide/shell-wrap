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
          # my-ruby = p:
          #   p.ruby_3_1.overrideAttrs (oldAttrs: {
          #     nativeBuildInputs =
          #       oldAttrs.nativeBuildInputs or [] ++ [
          #         p.makeWrapper
          #       ];
          #     postFixup = (oldAttrs.postFixup or "") + ''
          #       wrapProgram $out/bin/ruby \
          #         --set LD_LIBRARY_PATH x
          #     '';
          #   });
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
                # (my-ruby self)
                ruby_3_1

                postgresql_12
              ];

              nativeBuildInputs = [
                self.makeWrapper
              ];

              postBuild = ''
                wrapProgram $out/bin/ruby \
                  --set LD_LIBRARY_PATH x
                wrapProgram $out/bin/gem \
                  --set LD_LIBRARY_PATH x
              '';
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
