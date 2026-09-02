{
  ...
}: {

  flake.nixosModules.python = {
    pkgs,
    ...
  }:
    {
    environment.systemPackages = with pkgs; [
        python3
        virtualenv
        pyenv
    ];
  };  
}

