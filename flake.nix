{
  outputs = _: {
    homeModules = rec {
      television-ssh = ./module.nix;
      default = television-ssh;
    };
  };
}
