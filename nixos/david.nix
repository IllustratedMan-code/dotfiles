{config, pkgs, callPackage, ... }:
{home-manager.users.david = {

    nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
    ];
    programs.neovim = {
    enable = true;
    };
    xdg.configFile."nvim" = {
    source = /home/david/dotfiles/nvim;
    recursive = true;
    };
    home.packages = with pkgs; [discord pavucontrol autorandr texlive.combined.scheme-full];
};}
