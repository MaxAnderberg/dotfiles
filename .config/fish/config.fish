set PROMPT "lol"
set -U fish_greeting "🐟"
if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q exa
  alias ll "exa -l -g --icons"
  alias lla "ll -a"
end
# starship init fish | source

set -x URL_DB redis
set -x REDIS_URL redis://localhost:6379

#alias vim="/opt/homebrew/bin/nvim"
export EDITOR='/Users/max/.local/bin/lvim'
set -x GOPATH $HOME/Users/max/go
set -x PATH $PATH:/$GOPATH/bin


# tmux ide dekstop mode
function ide --description 'magix stuff!'
 tmux split-window -v -p 30
 tmux split-window -h -p 66
 tmux split-window -h -p 50
end

# tmux ide laptop mode
function idel --description 'magix stuff!'
 tmux split-window -v -p 30
 tmux split-window -h -p 50
end

#set -x rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
fish_add_path /opt/homebrew/bin
oh-my-posh --init --shell fish --config ~/.poshthemes/m365princess.json | source

set -x  PATH $HOME/.emacs.d/bin:$PATH
