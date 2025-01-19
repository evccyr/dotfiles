# Set available editor to open in current directory
if command -v hx >/dev/null
    set -gx EDITOR (which hx)
    set -gx VISUAL (which hx)
else
    set -gx EDITOR (which nvim)
    set -gx VISUAL (which nvim)
end

set -gx ATUIN_NOBIND true
set -gx SHELL (which fish)
set -gx DIRENV_LOG_FORMAT ""
set fish_greeting ""

if status is-interactive
    fish_vi_key_bindings
    function fish_user_key_bindings
      # bind --erase --key right
    	for mode in default insert
    	    bind -M $mode \cz "fg %(jobs | fzf | cut -c1)"
    	    bind -M $mode \cc cancel-cmd
    	    bind -M $mode \cw backward-kill-word
    	    # bind -M $mode \right forward-word
    	    bind -M $mode \ce $EDITOR .
    	end
    end
end

function cancel-cmd
    commandline ""
    emit fish_cancel
    commandline -f repaint
end

fzf_configure_bindings --directory=\cf

alias l="eza"
alias ll="eza -l"
alias la="eza -la"
alias lr="eza -laR"

alias d="z"
alias di="zi"
alias dp="cd -"

alias v="nvim"

zoxide init fish | source
starship init fish | source

# Plugins:
# jorgebucaran/fisher
# jorgebucaran/autopair.fish
# nickeb96/puffer-fish
# patrickf1/fzf.fish
# franciscolourenco/done
