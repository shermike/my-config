# Mike's bashrc

#export PS1="\u@\h:\w> "
export PS1='\[\e[0;32m\][\h \w]\$\[\e[0m\] '
#export PS1='\[\e[0;32m\][\h]\$\[\e[0m\] '

export PROMPT_COMMAND=

alias l='ls -la | grep "^d" && ls -la | grep -v "^d"'
alias ls="ls --color=auto"

alias emacs='emacs -nw'
alias ec='emacsclient -n'
alias vim=vimx
alias cfr='condor_free -d'
alias lq='condor_q -s msherstennik'
alias cq='/sw/tools/bin/grid/condor_queue -t | grep msherstenn'
alias split_ir='/sw/git/sw.git/trunk/bt/utils/perf/split_ir'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias kj='kill %%'
alias ps1short="export PS1='\[\e[0;32m\][\h]\$\[\e[0m\] '"
alias ps1long="export PS1='\[\e[0;32m\][\h \w]\$\[\e[0m\] '"
alias hist="history |grep "
alias bc='bc -ql'
alias le='less -s -M -N -G'
alias "cpwd=pwd|xclip"
alias "ppwd=popd"
alias gti='git'
alias fix='printf "\e[?2004l"'
alias gv='gvim -p --remote-tab-silent'
alias brld='. ~/.bashrc'
alias grep='grep --color=auto'
alias loc='cd /local_disk/msherstennikov'
alias src='cd /local_disk/msherstennikov/sw/bt/src-4.5'

export EDITOR=vimx
export VIEWER=less

export LESSANSIENDCHARS='mK'

# bash
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
export HISTTIMEFORMAT="%d/%m/%y %T "

shopt -s checkwinsize
