
case $- in
    *i*) ;;
      *) return;;
esac

HISTSIZE=1000
HISTFILESIZE=2000

### Terminal Tweaks ###

bold=$(tput bold);
orange=$(tput setaf 166);
yellow=$(tput setaf 228);
green=$(tput setaf 71);
white=$(tput setaf 15);
blue=$(tput setaf 51);
reset=$(tput sgr0);

PS1="\[${bold}\]\n"
PS1+="\[${orange}\]\u";                               # Orange Username
PS1+="\[${white}\] at "                               # White At
PS1+="\[${yellow}\]\h";                               # Yellow Host
PS1+="\[${white}\] in "                               # White In
PS1+="\[${green}\]\W";                                # Green Current Directory
PS1+="\n"
PS1+="\[${blue}\]";
PS1+=$'\xe2\x86\x92 ';                                # Unicode Symbol of Right-Arrow
PS1+="\[${reset}\]";                                  # Resetting the Colors
export PS1;

### Aliases ###

alias ..="cd ..";
alias ...="cd ../..";
alias ls="ls -la";
