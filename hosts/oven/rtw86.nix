{ stdenv, lib, fetchFromGitHub, kernel }:

stdenv.mkDerivation rec {
  pname = "rtw89";
  version = "unstable-2024-01-15";

  src = fetchFromGitHub {
    owner = "morrownr";
    repo = "rtw89";
    rev = "377f12eb9a8ca294f3429d5141d34261fa14f2e4";
    sha256 = "sha256-a+JIzEucrk8meziZy9IohrgShjwDn8m3U+QKDNB1p0c=";
  };

  hardeningDisable = [ "pic" "format" ];
  nativeBuildInputs = kernel.moduleBuildDependencies;

  makeFlags = [
    "KDIR=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build"
  ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/wireless/realtek
    cp *.ko $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/wireless/realtek/
    runHook postInstall
  '';

  meta = {
    description = "Realtek rtw89 out-of-tree kernel driver";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.linux;
  };
}
