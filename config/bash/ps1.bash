# PS1
PS1_BASH='\
\[\e[0;32m\]\u@\h: \
\[\e[0;36m\]\w\
\e[0;35m\]$(__git_ps1)
\[\e[2;32;47m\]\$\[\e[m\] '

export PS1=$PS1_BASH
