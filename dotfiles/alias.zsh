# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# globals
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
USER=`whoami`
BASEDIR=~/dotfiles
DOTDIR=~/dotfiles/dotfiles
ZSHDIR=~/.oh-my-zsh


# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# aliases
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
alias dup='docker-compose up'
alias start='tmuxinator start api'
alias ddm='./manage.py migrate'
alias dsm='./manage.py sqlmigrate'
alias dmm='./manage.py makemigrations'
alias dch='./manage.py check'
alias dsh='./manage.py shell'
alias drs='./manage.py runserver'
alias rbstr='rainbowstream'
alias qotd="python3 -c 'import wikiquote; print(wikiquote.quote_of_the_day())'"
alias jrepl='java -jar idea-IC-141.1532.4/javarepl.jar'
alias setjava8='sudo update-java-alternatives -s java-8-oracle'
alias setjava8env='sudo apt-get install oracle-java8-set-default'
alias setjava7='sudo update-java-alternatives -s java-7-oracle'
alias setjava7env='sudo apt-get install oracle-java7-set-default'
alias whereis2='dpkg -L'
alias rrdb='rake db:reset db:migrate'
alias rs='rails s'
alias df='df -aH .'
alias py="python"
alias py2='python2'
alias py3='python3'
alias pip2='pip'
alias pip3='pip3'
alias ipy='ipython'
alias pserve='python -m SimpleHTTPServer 5000'
alias tede='trans en:de'
alias tden='trans de:en'
alias p8='ping 8.8.8.8'
alias la='ls -FCA --color=tty'
alias s='ls'
alias rm='rm -I'
alias rmr='rm -rI'
alias e='exit'
alias G='| grep -i'
alias mv='mv -i'
alias v='vim'
alias mk='mkdir'
alias x='extract'
alias ssheval='eval `ssh-agent -s`'
alias ly='lynx -vikeys'
alias nx='PATH=$(npm bin):$PATH'
alias irssi='TERM=screen-256color irssi'
alias dall='dpkg --get-selections'
alias geml='gem list --local'
alias pyx='py -x'
alias pyl='py -l'
alias vssh='vagrant ssh'
alias -g L='| less'
alias -g H='| head'
alias -g S='| sort'
alias -g T='| tail'
alias -g SO='1> /dev/null'
alias -g SE='2> /dev/null'
alias aptar='sudo apt-get autoremove'
alias aptcl='sudo apt-get autoclean && sudo apt-get clean'
alias aptup='sudo apt-get update'
alias aptin='sudo apt-get install'
alias aptr='sudo apt-get remove'
alias aptp='sudo apt-get purge'
alias apti='sudo apt-get install'
alias aptupg='sudo apt-get upgrade'
alias apts='apt-cache search'
alias aptsh='apt-cache show'
alias epp='echo $PYTHONPATH'
alias dotf='cd $DOTDIR'
alias ev='vim ~/.vimrc'
alias et='vim ~/.tmux.conf'
alias ei='vim ~/.irssi/config'
alias ez='vim ~/.zshrc'
alias ea='vim $DOTDIR/alias.zsh'
alias ew='cd ~/work/'
alias sz='source ~/.zshrc'

# remove all unwatched files in a git repo
alias gdel='git status -s | cut -c4- | xargs rm -r $1'

alias gfucku='git push -f'
alias gi='git init'
alias gst='git status'
alias gs='git status -sb'
alias gla="git log --all --graph \
           --pretty=format:'%Cred%h%Creset \
           -%C(yellow)%d%Creset %s %Cgreen(%cr) \
           %C(bold blue)<%an>%Creset' \
           --abbrev-commit --date=relative"
alias ga='git add'
alias gb='git branch'
alias gow='git show'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gbr='git branch -r'
alias gab='git branch -a'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gd='git diff'
alias go='git checkout'
alias gob='git checkout -b'
alias gh='git hist'
alias gcl='git clone'
alias gra='git remote add'
alias grr='git remote rm'
alias gms='git merge --squash'
alias gr='git remote'
alias grv='git remote -v'
alias gp='git push'
alias gpu='git push -h'
alias gp='git push'
alias gher='git push heroku master'
alias gpl='git pull --rebase'
alias gplu='git pull -u --rebase'
alias gam='git commit --amend'
alias gamm='git commit --amend -m'
alias gl='git log'
alias gcv='git cherry -v'
alias gundo='git reset --soft HEAD'
alias gundoh='git reset --hard HEAD'
alias gun='git ls-files --others --exclude-standard'
alias gcn='git shortlog -s -n'
alias .c='git add --all && git commit -v'
alias tmux='tmux -2'
alias ta='tmux attach -t'
alias tnew='tmux new -s'
alias tls='tmux ls'
alias tkill='tmux kill-session -t'
alias snew='screen -S'
alias sls='screen -ls'
alias sa='screen -x'
alias eT='vim $HOME/todo.md'

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# functions
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
add_to_pp(){
    # add the first positional parameter to $PYTHONPATH
    export PYTHONPATH=$PYTHONPATH:$1;
}

copyid(){
    # as user '$1' at IP '$2', copy over our local ssh key
    # so we don't have to do type a password everytime we
    # ssh to this machine
    ssh-copy-id -i ~/.ssh/id_rsa.pub $1@$2
}

f(){
    # quick find. Takes one parameter - the search term
    echo "find . -iname \"*$1*\""
    sudo find . -iname "*$1*"
}

extract (){
    # never forget how to run a tar xyz command again
    # alias to 'x' for even more tastyness
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1;;
            *.tar.gz)    tar xzf $1;;
            *.bz2)       bunzip2 $1;;
            *.rar)       rar x $1;;
            *.gz)        gunzip $1;;
            *.tar)       tar xf $1;;
            *.tbz2)      tar xjf $1;;
            *.tgz)       tar xzf $1;;
            *.zip)       unzip $1;;
            *.Z)         uncompress $1;;
            *.7z)        7z x $1;;
            *.xz)        tar xf $1;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# make a backup of a file
# https://github.com/grml/grml-etc-core/blob/master/etc/zsh/zshrc
bk() {
    cp -a "$1" "${1}_$(date --iso-8601=seconds)"
}

# print terminal-wide banner
# souce: https://github.com/jleclanche/dotfiles/blob/master/.zshrc#L281
function hr {
    print ${(l:COLUMNS::=:)}
}

# get public ip
# souce: https://github.com/jleclanche/dotfiles/blob/master/.zshrc#L281
function myip {
    local api
    case "$1" in
        "-4")
            api="http://v4.ipv6-test.com/api/myip.php"
            ;;
        "-6")
            api="http://v6.ipv6-test.com/api/myip.php"
            ;;
        *)
            api="http://ipv6-test.com/api/myip.php"
            ;;
    esac
    curl -s "$api"
    echo # Newline.
}

# remove all installed GHC/cabal packages, leaving ~/.cabal binaries and docs
# in place. When all else fails, use this to get out of dependency hell and 
# start over - https://gist.github.com/timmytofu/7417408
function ghc-pkg-reset() {
  if [[ $(readlink -f /proc/$$/exe) =~ zsh ]]; then
    read 'ans?Erasing all your user ghc and cabal packages - are you sure (y/N)? '
  else # assume bash/bash compatible otherwise
    read -p 'Erasing all your user ghc and cabal packages - are you sure (y/N)? ' ans
  fi
 
  [[ x$ans =~ "xy" ]] && ( \
    echo 'erasing directories under ~/.ghc'; command rm -rf `find ~/.ghc/* -maxdepth 1 -type d`; \
    echo 'erasing ~/.cabal/lib'; command rm -rf ~/.cabal/lib; \
  )
}

# grep helper. Not case sensitive
function g() {
  grep -i $1 *
}

# grep helper. Not case sensitive and searchs recursively
function g() {
  grep -iR $1 *
}
