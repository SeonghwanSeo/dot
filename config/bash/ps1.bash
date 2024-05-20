# PS1

PROMPT_COMMAND='\
ret_val=$?
echo -ne "\033[s\033[500C\033[24D \
$(
    if [ ${ret_val} -eq 0 ]; then
        echo -ne "\e[1;32m:)";
    else
        echo -ne "\e[1;31m:(";
fi)\
\e[0m $(date "+%y-%m-%d - %H:%M:%S")\033[u"'

PS1_BASH='\
\[\e[0;32m\]\u@\h: \
\[\e[0;36m\]\w\
\e[0;35m\]$(__git_ps1)
'

export PS1=$PS1_BASH
