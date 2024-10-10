# load our own completion functions
fpath=(~/.zsh/completion /usr/local/share/zsh/site-functions $fpath)

# completion; use cache if updated within 24h
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit -d $HOME/.zcompdump;
else
  compinit -C;
fi;

# Enable completions
zstyle ':completion:*' menu select=2
# Match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# Separate matches into groups
zstyle ':completion:*:matches'         group 'yes'
zstyle ':completion:*'                 group-name ''
# Automatically find new executables in path
zstyle ':completion:*' rehash true
# Pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending
# Speed up completions
zstyle ':completion:*' use-cache true
zstyle ':completion:*' cache-path ~/.cache/zcache
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
# If you end up using a directory as argument, this will remove the trailing
# slash (useful in ln)
zstyle ':completion:*' squeeze-slashes true

# activate color-completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
# `cd` will never select the parent directory (e.g.: cd ../<TAB>)
zstyle ':completion:*:cd:*' ignore-parents parent pwd
# automatically complete 'cd -<tab>' and 'cd -<ctrl-d>' with menu
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:match:*' original only
# Allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:' max-errors 'reply=( $((($#PREFIX+$#SUFFIX)/3 )) numeric )'
# Start menu completion only if it could find no unambiguous initial string
zstyle ':completion:*:correct:*' insert-unambiguous true
zstyle ':completion:*:corrections' format $'%{\e[0;31m%}%d (errors: %e)%{\e[0m%}'
zstyle ':completion:*:correct:*' original true
# Define files to ignore for zcompile
zstyle ':completion:*:*:zcompile:*'    ignored-patterns '(*~|*.zwc)'
zstyle ':completion:correct:'          prompt 'correct to: %e'
# Insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
# Ignore completion functions for commands you don’t have:
zstyle ':completion:*:functions' ignored-patterns '_*'
# format on completion
zstyle ':completion:*:descriptions' format $'%{\e[0;31m%}completing %B%d%b%{\e[0m%}'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:options' auto-description '%d'
# Describe options in full
zstyle ':completion:*:options' description 'yes'
# complete manual by their section
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.*' insert-sections   true
zstyle ':completion:*:man:*' menu yes select
zstyle ':completion:*:paths' accept-exact '*(N)'
# On processes completion complete all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'
# Provide more processes in completion of programs like killall:
zstyle ':completion:*:processes-names' command 'ps c -u ${USER} -o command | uniq'
zstyle ':completion:*:kill:*' command 'ps -u $(whoami) -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
# Command for process lists, the local web server details and host completion
zstyle ':completion:*:urls' local 'www' '/var/www/' 'public_html'

# Search path for sudo completion
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin \
                                           /usr/local/bin  \
                                           /usr/sbin       \
                                           /usr/bin        \
                                           /sbin           \
                                           /bin

# Support for hosts completion
_etc_hosts=()
_ssh_config_hosts=()
_ssh_hosts=()
if is42 ; then
    if [[ -r ~/.ssh/config ]] ; then
        _ssh_config_hosts=(${${(s: :)${(ps:\t:)${${(@M)${(f)"$(<$HOME/.ssh/config)"}:#Host *}#Host }}}:#*[*?]*})
    fi

    if [[ -r ~/.ssh/known_hosts ]] ; then
        _ssh_hosts=(${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[\|]*}%%\ *}%%,*})
    fi

    if [[ -r /etc/hosts ]] && [[ "$NOETCHOSTS" -eq 0 ]] ; then
        : ${(A)_etc_hosts:=${(s: :)${(ps:\t:)${${(f)~~"$(grep -v '^0\.0\.0\.0\|^127\.0\.0\.1\|^::1 ' /etc/hosts)"}%%\#*}##[:blank:]#[^[:blank:]]#}}}
    fi
fi

local localname
localname="$(uname -n)"
hosts=(
    "${localname}"
    "$_ssh_config_hosts[@]"
    "$_ssh_hosts[@]"
    "$_etc_hosts[@]"
    localhost
)
zstyle ':completion:*:hosts' hosts $hosts

# disable zsh bundled function mtools command mcd
# which causes a conflict.
compdef -d mcd

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit
