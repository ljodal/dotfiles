# Enable completions from zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

autoload -Uz compinit && compinit

export EDITOR=nvim

# Aliases
alias ll='ls -lG'
alias la='ls -AlG'

# Add local bin files to path
export PATH="$HOME/.bin:$PATH"

# gettext (installed with homebrew)
export PATH=$PATH:/usr/local/Cellar/gettext/0.19.8.1/bin

# Enable direnv
eval "$(direnv hook zsh)"

#
# Python setup
#

export PIP_REQUIRE_VIRTUALENV=true

#
# Customize the prompt
#

# Customize the prompt to show the current branch
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
PROMPT='%F{magenta}%3~%f → '
RPROMPT='${vcs_info_msg_0_}'
zstyle ':vcs_info:git:*' formats '(%F{green}%b%f)'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#
# Other stuff
#

export PATH="$HOME/.poetry/bin:$PATH";

# Alias for less with synatx highlighting
alias lessh='LESSOPEN="| src-hilite-lesspipe.sh %s" less -mR '

# Add libpq (psql etc.) and postgresql to path
export PATH="/usr/local/opt/postgresql@11/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"

eval $(thefuck --alias)

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

# setup-venv <version>
function setup-venv {
    readonly version=${1:?"Python version must be specified"}

    "/opt/homebrew/opt/python@$version/bin/python3" -m venv .venv
    echo 'load_prefix "$(pwd)/.venv/"\nexport VIRTUAL_ENV="$(pwd)/.venv/"' >> .envrc
    direnv allow .
}
