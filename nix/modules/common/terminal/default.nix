{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./languages.nix
  ];

  environment = {
    systemPackages = with pkgs; [
      btop
      cursor-cli
      fastfetch
      fd
      fzf
      git
      killall
      kitty
      ripgrep
      tldr
      tmux
      tree
      unzip
      vim
      wget

      inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    ];
    variables = {
      XDG_CONFIG_HOME = "$HOME/.config";
      ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
    };
  };
}
