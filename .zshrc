ZSH_THEME="af-magic"

plugins=(git zsh-syntax-highlighting chucknorris docker z history)

# Adds / when expanding ..
zstyle ':completion:*' special-dirs true

# utf8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Disable "auto cd"
unsetopt AUTO_CD

# Aliases
alias lt="ls -ltFh"
alias less="vimpager"
alias gbrag='git shortlog -s -n --all'
alias gpr="git pull --rebase"
alias gp="git pull"

# Set JDK version
function setjdk() {
        if [ $# -ne 0 ]; then
                removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
                if [ -n "${JAVA_HOME+x}" ]; then
                        removeFromPath $JAVA_HOME/bin
		fi
		export JAVA_HOME=`/usr/libexec/java_home -v $@`
		export PATH=$JAVA_HOME/bin:$PATH
	fi
}
function removeFromPath() {
        export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
}
setjdk 1.8

set guifont=Inconsolata-dz\ for\ Powerline\ Medium\ 12

# Increase maximum open files
# https://stackoverflow.com/questions/19981065/nodejs-error-emfile-too-many-open-files-on-mac-os/27982223#27982223
ulimit -n 65536 65536

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



