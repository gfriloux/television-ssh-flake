{ config, lib, pkgs, ... }:

let
  cfg = config.programs.television-ssh;
in
{
  options.programs.television-ssh = {
    enable = lib.mkEnableOption "Enable television-ssh home-manager modules globally";
  };

  config = lib.mkIf cfg.enable {
    programs.television = {
      enable = true;
    };

    xdg.configFile."television/cable/ssh.toml".source = ../../../ssh.toml;
  };
}
