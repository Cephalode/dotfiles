{ inputs, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    code-cursor
    equicord

    inputs.zen-browser.packages."${system}".default
  ];
}
