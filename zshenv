# DOCS: This is read first and read every time, regardless of the shell being
# login, interactive, or none. This is the recommended place to set environment
# variables needed on every shell, even the ones launching scripts
#
# NOTE: Why would you need this? Because, for example, if you have a script that
# gets called by launchd, it will run under non-interactive non-login shell, so
# neither .zshrc nor .zprofile will get loaded.
#
# .zshenv → .zprofile → .zshrc → .zlogin → .zlogout

export BROWSER=firefox
export VISUAL=nvim
export EDITOR=nvim
export GOROOT=$HOME/.go
export MANPAGER="sh -c 'col -bx | bat -l man -p --theme=\"default\"'"
export MANROFFOPT="-c"
export CLIPPY_CONF_DIR=$HOME/.config/clippy
export DOCKER_BUILDKIT=1
export FZF_DEFAULT_OPTS_FILE=~/.fzfrc

# Local config
[[ -f ~/.zshenv.host ]] && source ~/.zshenv.host
[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
