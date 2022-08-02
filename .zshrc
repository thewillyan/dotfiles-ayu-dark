# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/will/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

##### PROMPT COMFIGURATION #####
# git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# layout
PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{blue}%~%f%b %# '
##### END ####

# declare default code directory
export CODE_DIR="/home/will/Desktop/code"

# Set neovim as the default editor
export VISUAL=nvim;
export EDITOR=nvim;

# nnn file manager config
export NNN_BMS="d:$HOME/Documents;D:$HOME/Downloads/;c:$CODE_DIR;h:$HOME"
export LC_COLLATE="C"
export NNN_TRASH=1 
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn -C "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

##### ALIASES #####
# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

#redyt
alias libredyt="/home/will/Desktop/code/shell/libredyt.sh"

# music
alias codefi='ytfzf -mc U "https://vid.puffyan.us/watch?v=tnuE7_rzFtM"'
alias lofi='ytfzf -mc U "https://vid.puffyan.us/watch?v=5qap5aO4i9A"'

# shortcut to not let the screen turns black 
alias keepScreenOn='xset -dpms && xset s off'

# simple bash script to make backup
alias backup='/home/will/Desktop/code/shell/backup.sh'

# fzf ralated aliases
alias fcd='cd $(dirname $(fzf))'
alias fvi='fzf | xargs nvim'
alias fvd='cd $(dirname $(fzf)) && nvim .'

# misc
alias code="cd $CODE_DIR"
alias :q="exit"
alias l="ls -lah --color"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias tree='tree -C'
alias searx='w3m https://searx.be'
####### END #######

# fzf config
export FZF_DEFAULT_OPTS="--color=16"
