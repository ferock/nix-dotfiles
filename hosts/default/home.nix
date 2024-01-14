{ inputs, config, pkgs, lib, outputs, ... }:

{
imports = [
	inputs.nixvim.homeManagerModules.nixvim
	../../modules/nvim
];
  
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "f3r0ck";
  home.homeDirectory = "/home/f3r0ck";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
    pkgs.ripgrep 
    pkgs.fd 
    pkgs.curl 
    pkgs.less
    pkgs.jq
    pkgs.swaylock
    pkgs.swayidle
    pkgs.killall
    pkgs.pavucontrol
    pkgs.swaynotificationcenter

    pkgs.rofi-systemd
    pkgs.rofi-power-menu

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    (pkgs.nerdfonts.override { fonts = [ "Hack" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  # };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/root/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    PAGER = "less";
    CLICOLOR = 1;
  };

  home.shellAliases = {
    "lg" = "lazygit";
    "vim" = "nvim";
    "n" = "nvim";
  };

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;
  programs.bat.enable = true;
  programs.fzf = {
	enable = true;
	enableZshIntegration = true;
  };
  programs.git.enable = true;
  programs.zsh = {
	enable = true;
	enableCompletion = true;
	enableAutosuggestions = true;
	syntaxHighlighting = {
	  enable = true;
	};
	oh-my-zsh = {
	  enable = true;
	  theme = "gnzh";
	  plugins = [ "git" "docker" "npm" "pip" ];
	};
  };
  programs.go.enable = true;
  programs.lsd.enable = true;
  programs.k9s.enable = true;
  programs.lazygit = {
	enable = true;
	settings.gui = {
		theme = {
			activeBorderColor = ["#89dceb" "bold"];
			inactiveBorderColor = ["#a6adc8"];
			optionsTextColor = ["#89b4fa"];
			selectedLineBgColor  = ["#313244"];
			selectedRangeBgColor = ["#313244"];
			cherryPickedCommitBgColor = ["#45475a"];
			cherryPickedCommitFgColor = ["#89dceb"];
			unstagedChangesColor =["#f38ba8"];
			defaultFgColor =["#cdd6f4"];
			searchingActiveBorderColor =["#f9e2af"];
		};
	};
  };
  programs.kitty = {
	enable = true;
  	font = {
	  name = "Hack Nerd Font";
	  size = 13;
	};
	shellIntegration = {
	  enableZshIntegration = true;
	};
	settings = {
	  enable_audio_bell = false;
	  macos_option_as_alt = false;
	  hide_window_decorations = "titlebar-only";
	  single_window_margin_width = 4;
	  disable_ligatures = false;
	  url_style = "curly";
	  mouse_hide_wait = 3;
	  detect_urls = true;
	  input_delay = 3;
	  sync_to_monitor = true;
	  background_opacity = "0.6";
	};
	theme = "Catppuccin-Mocha";
        keybindings = {
          "ctrl+left" = "neighboring_window left";
          "ctrl+right" = "neighboring_window right";
          "ctrl+up" = "neighboring_window up";
          "ctrl+down" = "neighboring_window down";
          "ctrl+shift+z" = "toggle_layout stack";
          "ctrl+shift+t" = "new_tab_with_cwd";
          "ctrl+shift+enter" = "new_window_with_cwd";
        };
  };

  programs.nixvim = {
   enable = true;
  };

  programs.rofi = {};

  programs.swaylock = {
    enable = true;
    settings = {
      show-failed-attempts = true;
      screenshots = true;
      clock = true;

      indicator = true;
      indicator-radius = 350;
      indicator-thickness = 5;

      effect-blur = "7x5";
      effect-vignette = "0.5:0.5";
      fade-in = 0.2;

    };
  };

  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "${pkgs.swaylock-effects}/bin/swaylock --screenshots --clock --indicator --effect-pixelate 4 --effect-blur 4x4";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "hibernate";
        action = "${pkgs.systemd}/bin/systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "logout";
        action = "${pkgs.systemd}/bin/loginctl terminate-user $USER";
        text = "Logout";
        keybind = "L";
      }
      {
        label = "shutdown";
        action = "${pkgs.systemd}/bin/systemctl poweroff";
        text = "Shutdown";
        keybind = "S";
      }
      {
        label = "suspend";
        action = "${pkgs.systemd}/bin/systemctl suspend-then-hibernate";
        text = "Suspend";
        keybind = "s";
      }
      {
        label = "reboot";
        action = "${pkgs.systemd}/bin/systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    style = builtins.readFile ./style.css;
  };

  services.dunst.enable = true;
  services.swayidle = {
    enable = true;
    systemdTarget = "hyprland-session.target";
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
      }
    ];
    timeouts = [
      {
        timeout = 600;
        command = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms off";
        resumeCommand = "${config.wayland.windowManager.hyprland.package}/bin/hyprctl dispatch dpms on";
      }
      {
        timeout = 610;
        command = "${pkgs.systemd}/bin/loginctl lock-session";
      }
    ];
  };

   programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    extraConfig = {
      modi = "run,drun,window";
      show-icons = true;
      drun-display-format = "{icon} {name}";
      location = 0;
      disable-history = false;
      hide-scrollbar = true;
      display-drun = "   Apps ";
      display-run = "   Run ";
      display-window = " 﩯  Window";
      display-Network = " 󰤨  Network";
      sidebar-mode = true;
      #font = config.my.settings.fonts.monospace;
    };
    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      #"@import" = "default";

      "*" = {
        bg-col = mkLiteral "#1f1e2e";
        bg-col-light = mkLiteral "#1f1e2e";
        border-col = mkLiteral "#1f1e2e";
        selected-col = mkLiteral "#1f1e2e";
        blue = mkLiteral "#b4befe";
        fg-col = mkLiteral "#11111b";
        fg-col2 = mkLiteral "#11112b";
        grey = mkLiteral "#737994";
        width = 600;
      };

      "element-text, element-icon , mode-switcher" = {
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "window" = {
        height = mkLiteral "360px";
        border = mkLiteral "3px";
        border-color = mkLiteral "@border-col";
        background-color = mkLiteral "@bg-col";
      };

      "mainbox" = {
        background-color = mkLiteral "@bg-col";
      };

      "inputbar" = {
        children = mkLiteral "[prompt,entry]";
        background-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "5px";
        padding = mkLiteral "2px";
      };

      "prompt" = {
        background-color = mkLiteral "@blue";
        padding = mkLiteral "6px";
        text-color = mkLiteral "@bg-col";
        border-radius = mkLiteral "3px";
        margin = mkLiteral "20px 0px 0px 20px";
      };

      "textbox-prompt-colon" = {
        expand = false;
        #str =  mkLiteral ":";
      };

      "entry" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 10px";
        text-color = mkLiteral "@fg-col";
        background-color = mkLiteral "@bg-col";
      };

      "listview" = {
        border = mkLiteral "0px 0px 0px";
        padding = mkLiteral "6px 0px 0px";
        margin = mkLiteral "10px 0px 0px 20px";
        columns = 2;
        lines = 5;
        background-color = mkLiteral "@bg-col";
      };

      "element" = {
        padding = mkLiteral "5px";
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@fg-col";
      };

      "element-icon" = {
        size = mkLiteral "25px";
      };

      "element selected" = {
        background-color = mkLiteral "@selected-col";
        text-color = mkLiteral "@fg-col2";
      };

      "mode-switcher" = {
        spacing = 0;
      };

      "button" = {
        padding = mkLiteral "10px";
        background-color = mkLiteral "@bg-col-light";
        text-color = mkLiteral "@grey";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.5";
      };

      "button selected" = {
        background-color = mkLiteral "@bg-col";
        text-color = mkLiteral "@blue";
      };

      "message" = {
        background-color = mkLiteral "@bg-col-light";
        margin = mkLiteral "2px";
        padding = mkLiteral "2px";
        border-radius = mkLiteral "5px";
      };

      "textbox" = {
        padding = mkLiteral "6px";
        margin = mkLiteral "20px 0px 0px 20px";
        text-color = mkLiteral "@blue";
        background-color = mkLiteral "@bg-col-light";
      };
    };
  };
  

  xdg.configFile."hypr/hyprland.conf".source = ../../hypr/hyprland.conf;
  xdg.configFile."hypr/configs".source = ../../hypr/configs;
  xdg.configFile."hypr/configs".recursive = true;
}
