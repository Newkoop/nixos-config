{ config, pkgs, ... }:

{
  users.users.maikel.shell = pkgs.zsh;

  environment.systemPackages = with pkgs; [
    zsh
    tmux
    nerd-fonts.jetbrains-mono
  ];

  programs.zsh.enable = true;

  # Tmux configuration
  programs.tmux = {
    enable = true;
    baseIndex = 1; # Start windows numbering at 1
    extraConfig = ''
      # Start panes numbering at 1
      set -g pane-base-index 1

      # Other common tmux settings you might want
      set -g mouse on
      set -g history-limit 10000
    '';
  };

  # Zap installer (minimal) with powerlevel10k
  environment.shellInit = ''
    export ZDOTDIR=$HOME/.config/zsh
    [ -f "$ZDOTDIR/.zshrc" ] || (
      mkdir -p "$ZDOTDIR"
      curl -fsSL https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh | zsh
    )
  '';

  # Add powerlevel10k configuration to .zshrc
  system.userActivationScripts.setupZshConfig = {
    text = ''
      # Backup existing .zshrc if it exists
      if [ -f "$HOME/.config/zsh/.zshrc" ]; then
        mv "$HOME/.config/zsh/.zshrc" "$HOME/.config/zsh/.zshrc.bak-$(date +%s)"
      fi

      # Create a new .zshrc with proper formatting
      cat > $HOME/.config/zsh/.zshrc << 'EOF'
      # Initialize Zap plugin manager
      [ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

      # Plugins
      plug "zsh-users/zsh-autosuggestions"
      plug "zsh-users/zsh-syntax-highlighting"
      plug "romkatv/powerlevel10k"

      # Load and initialise completion system
      autoload -Uz compinit
      compinit

      # To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh
      [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
      EOF
    '';
    deps = [ ];
  };
}
