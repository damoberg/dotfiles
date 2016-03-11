# Adds / when expanding ..
zstyle ':completion:*' special-dirs true

# utf8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Disable "auto cd"
unsetopt AUTO_CD

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

