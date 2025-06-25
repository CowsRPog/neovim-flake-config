{ config, lib, pkgs, inputs, ... }:

let 
  cfg = config.neovim-flake;
in {
  options = {
    neovim-flake.enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "Enable NeoVim config";
    };
  };

  config = lib.mkIf cfg.enable {
    home.file.".config/nvim".source = ./../neovim;
  };
}
