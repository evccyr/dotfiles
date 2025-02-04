{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [ inputs.sops-nix.homeManagerModules.sops ];
  
  home.username = "yash";
  home.homeDirectory = "/home/yash";
  home.stateVersion = "24.11";

  sops = {
    defaultSopsFile = ./secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = "/home/yash/.config/sops/age/keys.txt";
    secrets."api_keys/openai_api_key" = {};
    secrets."api_keys/anthropic_api_key" = {};
  };

  home.packages = with pkgs; [
    vlc
    vscode
    acpi
    hyprpicker
    warp-terminal
    gh
    fd
    fzf
    eza
    zip
    bat
    yazi
    tldr
    delta
    unzip
    nsxiv
    copyq
    bottom
    ripgrep
    wl-clipboard
    protonvpn-cli
    bun
    dunst
    grimblast
    brightnessctl
    kanata-with-cmd
    brave
    bottom
    nodejs_23
    gnumake
    fuzzel
    firefox
    google-chrome
    
    age
    sops

    nil
    marksman
    alejandra
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yash/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    fish = {
      enable = true;
      plugins = [
        {
          name = "done";
          src = pkgs.fishPlugins.done.src;
        }
        {
          name = "autopair";
          src = pkgs.fishPlugins.autopair.src;
        }
        {
          name = "fzf.fish";
          src = pkgs.fishPlugins.fzf-fish.src;
        }
        {
          name = "puffer";
          src = pkgs.fishPlugins.puffer.src;
        }
      ];
      shellAliases = {
        ls = "eza";
        d = "z";
        di = "zi";
      };
      interactiveShellInit = ''
        # Only run this in interactive shells
        if status is-interactive

          # Set the cursor shapes for the different vi modes.
          set fish_cursor_default     block      blink
          set fish_cursor_insert      line       blink
          set fish_cursor_replace_one underscore blink
          set fish_cursor_visual      block

          function fish_user_key_bindings
            # Execute this once per mode that emacs bindings should be used in
            fish_default_key_bindings -M insert
            fish_vi_key_bindings --no-erase insert
          end
        end
      '';
    };

    ghostty = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        command = "fish";
        font-size = 11;
        # theme = "dark:GruvboxDarkHard,light:GruvboxLight";
        # theme = "GruvboxDarkHard";
        theme = "GruvboxLight";
      };
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    home-manager.enable = true;
  };
}
