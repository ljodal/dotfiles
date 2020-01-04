# Enable completions from zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit && compinit

# Aliases
alias ll='ls -lG'
alias la='ls -AlG'

# Add fastlane to path
export PATH="$HOME/.fastlane/bin:$PATH"

# Add homebrew sbin to path
export PATH="/usr/local/sbin:$PATH"

# Add local bin files to path
export PATH="$PATH:$HOME/.bin"

# gettext (installed with homebrew)
export PATH=$PATH:/usr/local/Cellar/gettext/0.19.8.1/bin
export PATH=/usr/local/opt/node@6/bin:$PATH

# Enable direnv
eval "$(direnv hook zsh)"

#
# Ruby setup
#

# Enable chruby with auto switching
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

# Set default ruby as 2.7.0
chruby ruby-2.7.0
local DEFAULT_RUBY_VERSION="$RUBY_VERSION"

function __ruby_version() {
    # If a non-default Ruby version is set, show that in the prompt
    if [[ "$DEFAULT_RUBY_VERSION" != "$RUBY_VERSION" ]]; then
        echo " (%F{red}$RUBY_VERSION%f)"
    else
        echo ''
    fi
}

#
# Python setup
#

export PIP_REQUIRE_VIRTUALENV=true
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
local DEFAULT_PYTHON_VERSION="$(pyenv global)"

function __python_version() {
    # If a non-default Python version is set, show that in the prompt
    if [ -n "$PYENV_VERSION" ]; then
        echo " (%F{blue}$PYENV_VERSION%f)"
    elif [[ $VIRTUAL_ENV =~ 'versions/([0-9]+\.[0-9]+\.[0-9]+)/' ]]; then
        echo " (%F{blue}${match[1]}%f)"
    else
        echo ''
    fi
}

#
# Customize the prompt
#

# Customize the prompt to show the current branch
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%F{magenta}%3~%f → '
RPROMPT='${vcs_info_msg_0_}$(__python_version)$(__ruby_version)'
zstyle ':vcs_info:git:*' formats '(%F{green}%b%f)'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#
# Other stuff
#

export PATH="$HOME/.poetry/bin:$PATH";

# Add libpq (psql etc. to path)
export PATH="/usr/local/opt/libpq/bin:$PATH"

# Alias for less with synatx highlighting
alias lessh='LESSOPEN="| src-hilite-lesspipe.sh %s" less -M '

export PATH="/usr/local/opt/postgresql@11/bin:$PATH"

eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi
