# television-ssh-flake

## Installation

### flakes + home-manager

Ajouter notre dépôt en inputs:
```
television-ssh = {
  url = "github:gfriloux/television-ssh-flake";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

Ensuite dans votre config `home-manager`:
```
modules = [
  television-ssh.homeModules.default
];

programs.television-ssh.enable = true;
```

### À la main

Installer les dépendances:

- [tv](https://github.com/alexpasmantier/television)
- `ssh`
- `awk`
- `bat`
- `grep`

Copier `ssh.toml` dans `~/.config/television/cable/`.

## Utilisation

Invoquer `tv ssh` va permettre de lister vos configs
`ssh` via [tv](https://github.com/alexpasmantier/television) afin
de vous connecter aux machines déclarées.

Pour cela, vos configs doivent être dans `~/.ssh/config.d`.

### Ajouter des scripts

Par exemple, si vos configs sont dans `vaultwarden`, vous
pouvez créér `~/.ssh/scripts/update`:
```bash
#!/usr/bin/env bash

rbw ls                                         \
  | grep '.ssh.conf'                           \
  | xargs -t -I {} sh -c "rbw get {} >~/.ssh/config.d/{}"

find ~/.ssh/config.d/ -maxdepth 1 -mmin +10 -type f -exec rm {} \;

exit 0
```

cela vous permettra d'invoquer la récupération de vos
configs `ssh` via `ctrl+u` depuis `tv ssh`.
