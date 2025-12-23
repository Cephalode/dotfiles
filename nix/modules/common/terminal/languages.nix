{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    python3
    zig # Zig and C compiler (faster than any other C compiler)

    # Neovim Language Servers
    python313Packages.pylsp-mypy
    lua-language-server
    typescript-language-server
    nil # Nix language server
  ];
}
