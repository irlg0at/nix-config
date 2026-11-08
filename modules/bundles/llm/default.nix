{
  ...
}:
{

  flake.nixosModules.llm =
    {
      pkgs,

      ...
    }:
    {
      environment.systemPackages = [
        pkgs.opencode
      ];

    };
}
