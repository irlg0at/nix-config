{
  ...
}: {

  flake.nixosModules.llm = {
    pkgs,
    lib,
    ...
  }:
  let
    llama-cpp-vulkan = pkgs.llama-cpp.override { vulkanSupport = true; };
  in
    {
    environment.systemPackages = [
      llama-cpp-vulkan
      pkgs.vulkan-tools
      pkgs.opencode
    ];

    systemd.user.services.llama-server = {
      description = "llama.cpp server for local inference";
      wantedBy = [ "default.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = lib.concatStringsSep " " [
          (lib.getExe' llama-cpp-vulkan "llama-server")
          "-m %h/models/Qwen3.6-35B-A3B-UD-Q4_K_M.gguf"
          "--alias qwen3.6"
          "-ngl 99"
          "-fa on"
          "-c 32768"
          "-b 8192"
          "-ub 2048"
          "--jinja"
          "--host 127.0.0.1"
          "--port 8080"
        ];
        Restart = "on-failure";
        RestartSec = 5;
      };
    };
  };
}
