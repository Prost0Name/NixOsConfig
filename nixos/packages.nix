{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    obs-studio
    obsidian
    gparted
    google-chrome
    telegram-desktop
    home-manager
    # jetbrains.clion
    alacritty
    freeoffice
    spectacle
    vscode

    gnumake
    gcc
    gdb # 😞
    lldb
    python3
    cmake
    # python3.withPackages (ps: with ps; [ requests ])

    git
    tree

    pipewire
    pulseaudio
    pamixer

    # fish
    fishPlugins.done
    fishPlugins.fzf-fish
    fishPlugins.forgit
    fishPlugins.hydro
    fzf
    fishPlugins.grc
    grc
  ];
 
  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
