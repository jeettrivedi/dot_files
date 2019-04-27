#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='nvim'
alias climaple='~/maple2017/bin/maple'
alias maple='nohup ~/maple2017/bin/xmaple >> /dev/null'
alias l='ls'
export TERM=linux

PS1='[\u@\h \W]\$ '

if [ -e ~/.bashrc.aliases ] ; then
   source ~/.bashrc.aliases
fi
# >>> Added by cnchi installer
BROWSER=/usr/bin/chromium
EDITOR=/usr/bin/nano

cat /home/bread/.cache/wal/sequences

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

PATH=$PATH:/home/bread/.local/bin
# # added by Anaconda3 5.3.1 installer
# # >>> conda init >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/bread/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     \eval "$__conda_setup"
# else
#     if [ -f "/home/bread/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/home/bread/anaconda3/etc/profile.d/conda.sh"
#         CONDA_CHANGEPS1=false conda activate base
#     else
#         \export PATH="/home/bread/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda init <<<
# export LD_LIBRARY_PATH="/home/bread/code playground/polaris/CCfits/.libs/:/home/bread/code playground/polaris/cfitsio:${LD_LIBRARY_PATH}"
# export PATH="/home/bread/code playground/polaris/bin:$PATH"
