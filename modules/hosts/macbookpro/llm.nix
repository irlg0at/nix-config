{ ... }:
{
  flake.nixosModules.macbookproConfig = { ... }: {
    boot.kernelParams = [
      "amdgpu.gttsize=24576"
      "ttm.pages_limit=7340032"
    ];
  };
}
