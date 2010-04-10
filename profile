
# MacPorts Installer addition on 2009-09-02_at_11:09:56: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/Users/adam/bin:/Users/adam/binpy:/opt/local/bin:/opt/local/sbin:/Users/adam/dev/android-sdk-mac_x86-1.5_r3/tools:$PATH
export PATH=/Users/adam/bin:/Users/adam/binpy:/opt/local/bin:/opt/local/sbin:/Users/adam/dev/android-sdk-mac_86:/Users/adam/dev/android-sdk-mac_86/tools:$PATH


# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2009-09-02_at_11:09:56: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

#export LC_CTYPE=pl_PL.UTF-8
#export LC_CTYPE=en_EN.UTF-8
#export LC_ALL=pl_PL.UTF-8
#export LANG=en_EN.UTF-8
alias ls='ls -Gal'
alias grep='grep --color'
#export PS1="\u@\w$ "
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home
LC_COLLATE="pl_PL.UTF-8"
LC_CTYPE="pl_PL.UTF-8"
LC_MESSAGES="pl_PL.UTF-8"
LC_MONETARY="pl_PL.UTF-8"
LC_NUMERIC="pl_PL.UTF-8"
LC_TIME="pl_PL.UTF-8"
#export PROMPT_COMMAND='PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'
red="\033[1;31m";
norm="\033[0;39m";
cyan="\033[1;36m";

if [ "$PS1" ]; then
    PS1="\[$cyan\]\u@\h:\w\\[\033[0;39m\]\n\$ "
    export PROMPT_COMMAND="echo -n \[\$(date +%H:%M:%S)\]"
    export PS1=" "$PS1"\[\e]30;\u@\h\a\]"
fi
export EDITOR=vim
