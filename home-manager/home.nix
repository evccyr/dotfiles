{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];

  stylix = {
    enable = true;
    polarity = "light";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-soft.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    image = ../backgrounds/background.jpg;
  };

  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/yash/.config/sops/age/keys.txt";
    secrets."api_keys/openai_api_key" = {};
    secrets."api_keys/anthropic_api_key" = {};
  };

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
    home-manager.enable = true;
  };

  home = {
    username = "yash";
    homeDirectory = "/home/yash";
    stateVersion = "24.11";
    sessionVariables = {
      EDITOR = "nvim";
    };

    packages = with pkgs; [
      acpi
      age
      alejandra
      bat
      bottom
      brave
      brightnessctl
      bun
      copyq
      delta
      dunst
      eza
      fastfetch
      fd
      firefox
      fish
      fishPlugins.autopair
      fishPlugins.done
      fishPlugins.puffer
      fuzzel
      gh
      ghostty
      gitui
      gnumake
      google-chrome
      grimblast
      hypridle
      hyprlock
      hyprpaper
      hyprpicker
      hyprpolkitagent
      kanata-with-cmd
      marksman
      nil
      nix-your-shell
      nodejs_23
      nsxiv
      protonvpn-cli
      ripgrep
      sops
      starship
      television
      tldr
      unzip
      vlc
      vscode
      wl-clipboard
      yazi
      zip
      zoxide
    ];
  };
}
