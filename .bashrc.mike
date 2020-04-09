# Mike's bashrc

#export PS1="\u@\h:\w> "
export PS1='\[\e[0;32m\][\h \w]\$\[\e[0m\] '
#export PS1='\[\e[0;32m\][\h]\$\[\e[0m\] '

export PROMPT_COMMAND=

alias l='ls -la | grep "^d" && ls -la | grep -v "^d"'
alias ls="ls --color=auto"

alias emacs='emacs -nw'
alias ec='emacsclient -n'
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
alias "c=xclip"
alias "v=xclip -o"
alias "cpwd=pwd|xclip"
alias "ppwd=popd"
alias gti='git'
alias fix='printf "\e[?2004l"'
alias gv='gvim -p --remote-tab-silent'
alias brld='. ~/.bashrc'
alias grep='grep --color=auto'

export EDITOR=vim
export VIEWER=less

export LESSANSIENDCHARS='mK'

# bash
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
export HISTTIMEFORMAT="%d/%m/%y %T "
#export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

SVN_EDITOR=vim

shopt -s checkwinsize

alias install='sudo apt-get install'

alias hex='hexdump -C -v'
alias scr=screen


alias tmux="TERM=xterm-256color tmux"
