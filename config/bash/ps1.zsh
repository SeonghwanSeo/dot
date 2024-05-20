setopt PROMPT_SUBST

VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true
VI_MODE_SET_CURSOR=true

MODE_INDICATOR=$'%F{cyan}N>%f '
INSERT_MODE_INDICATOR=$'%F{magenta}I>%f '
VISUAL_MODE_INDICATOR=$'%F{magenta}V>%f '
KEYTIMEOUT=1

local return_code="%(?.%{$fg_bold[green]%}:)%{$reset_color%}.%{$fg_bold[red]%}%? :(%{$reset_color%})"

export PS1='\
%{$fg[green]%}%n@%m: \
%{$fg[cyan]%}%~\
%{$fg[magenta]%}$(__git_ps1)
$(vi_mode_prompt_info)\
%{$reset_color%}'

RPS1='${return_code} %D - %*'
