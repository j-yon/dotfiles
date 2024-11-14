if [ -f /etc/zshrc ]; then
    . /etc/zshrc
fi

umask 002

if [ -f $ZDOTDIR/.zshrc ]; then
    source $ZDOTDIR/.zshrc
fi

# Pathing
export PATH="$PATH:$HOME/bin/"
# export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin
