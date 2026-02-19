{pkgs,...}:
{
	programs.vivaldi = {
		enable = true;
	};

  programs.jabref.enable = true;
  home.file = {
    ".config/vivaldi/NativeMessagingHosts/org.jabref.jabref.json" = {
      recursive = true;
      text = '' 
      {
        "name": "org.jabref.jabref",
        "description": "JabRef",
        "path": "${pkgs.jabref}/lib/jabrefHost.py",
        "type": "stdio",
        "allowed_origins": [
          "chrome-extension://bifehkofibaamoeaopjglfkddgkijdlh/",
          "chrome-extension://pgkajmkfgbehiomipedjhoddkejohfna/"
        ]
      }
        '';

    };
  };
}
