# .bashrc
export CONFIG_DIR=$SH_DIR/config
export TERM=xterm-256color

alias shome='cd $SH_DIR'

alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
function cd() { builtin cd $1 && ls; }

alias vi='nvim -u $CONFIG_DIR/nvim/init.lua'
alias vir='vi -R'
alias cls='clear && echo -en "\e[3J"'

alias bashrc_cfg='vi $CONFIG_DIR/bash/.bashrc'

#tmux
alias tmuxs='tmux new -s shwan'
alias tmuxn='tmux new -s '
alias tas='tmux attach -t shwan'
alias ta='tmux attach -t'
if { [ -n "$TMUX" ]; } then
        tmux source-file $CONFIG_DIR/tmux/.tmux.conf
    fi

# git
alias gs='git status'                                                                                    
alias gl='git pull'                                                                                      
alias gp='git push'
alias ga='git add'                                                                                     
alias gal='git add .'
alias gcm='git commit -m '
alias gr='git restore --staged'
c_sgr0=`tput sgr0`
parse_git_branch() {
         git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

# ps
export PS1='\[\e[32m\]\u@${HOSTNAME}\]\033[00m\]: \[\e[1;36m\]\w\e[35m\]$(parse_git_branch)\[${c_sgr0}\] \n\[\e[m\]\[\e[32;47m\]\\$\[\e[m\] '
