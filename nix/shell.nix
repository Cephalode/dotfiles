with (import <nixpkgs> {});
mkShell {
  buildInputs = [
    pkgs.neovim
  ];

  shellHook = ''
    echo "Welcome back sir."
  '';
}
