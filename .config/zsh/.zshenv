export LANG=ja_JP.UTF-8
export EDITOR=vim

export PATH=/usr/local/bin:$PATH

# XDG Base Directory
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_CONFIG_DIRS=/etc/xdg

export HISTFILE=$XDG_DATA_HOME/zsh/history

export RLWRAP_HOME=$XDG_DATA_HOME/rlwrap


export RBENV_ROOT=$XDG_DATA_HOME/rbenv

if [[ -d $RBENV_ROOT ]]; then
  eval "$(rbenv init -)"
fi

export PATH=$HOME/bin:$PATH

