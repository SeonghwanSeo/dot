# .bashrc
export TERM=xterm-256color

alias shome='cd $WORK_DIR'

alias ls='ls --color'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
function cd() { builtin cd $1 && ls; }

alias vi='nvim -u $CONFIG_DIR/nvim/init.lua'
alias vir='vi -R'
alias cls='clear && echo -en "\e[3J"'

alias bashrc_cfg='vi $CONFIG_DIR/bash/.bashrc'

#tmux
alias tmux='TERM=xterm-256color tmux'
alias tmuxs='tmux -u new -s shwan'
alias tn='tmux -u new -s '
alias tas='tmux attach -t shwan'
alias ta='tmux attach -t'

if { [ -n "$TMUX" ]; } then
    tmux source-file $CONFIG_DIR/tmux/.tmux.conf
else
    alias tmux='tmux -f $CONFIG_DIR/tmux/.tmux.conf'
fi

# git
alias gs='git status'                                                                                    
alias gl='git pull'                                                                                      
alias gp='git push'
alias ga='git add'                                                                                     
alias gal='git add .'
alias gcm='git commit -m '
alias gr='git restore --staged'

if { [ "$SHELLTYPE" = 'BASH' ]; } then
    source $CONFIG_DIR/git/git-completion.bash
fi
source $CONFIG_DIR/git/git-prompt.sh

# PS1
#PS1_BASH='\e[0;32m\]\u@\h: \e[0;36m\]\w\e[0;35m\]$(__git_ps1)\n\e[2;32;47m\]\$\e[m\] '
PS1_BASH='\
\[\e[0;32m\]\u@\h: \
\[\e[0;36m\]\w\
\e[0;35m\]$(__git_ps1)
\[\e[2;32;47m\]\$\[\e[m\] '

PS1_ZSH='\
%{$fg[green]%}%n@%m: \
%{$fg[cyan]%}%~\
%{$fg[magenta]%}$(__git_ps1)
%{$fg[green]%}%{$bg[white]%}$%{$reset_color%} ' 

# /u@/h: dir (git)
if { [ "$SHELLTYPE" = 'BASH' ]; } then
    export PS1=$PS1_BASH
    #export PS1='\e[0;32m\]\u@\h: \e[0;36m\]\w\e[0;35m\]$(__git_ps1) \e[0;m\][\t] \n\e[2;32;47m\]\$\e[m\] '
else
    export PS1=$PS1_ZSH
fi
