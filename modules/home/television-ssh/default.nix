{ config, lib, pkgs, ... }:

let
  cfg = config.television-ssh.hm;
in
{
  options.television-ssh.hm = {
    enable = lib.mkEnableOption "Enable television-ssh home-manager modules globally";
  };

  config = lib.mkIf cfg.enable {
    programs.television = {
      enable = true;
    };

    xdg.configFile."television/cable/ssh.toml".source = ../../../ssh.toml;
  };
}
