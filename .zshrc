alias ll='ls --color=auto -lah --group-directories-first '
alias lp='k --all'
alias llt='ls --color=auto -laht --group-directories-first' # Sort by newest first.
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias du="du -h --time"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias belinux="find . -type f -exec dos2unix {} \;"

dircolorrc=~/dircolors
eval "$(dircolors $dircolorrc)"

clast () {
	git checkout @{-1}
}

clastn () {
	git checkout @{-$1}
}

fliptable()
{
	echo "（╯°□°）╯ ┻━┻";
}

get_hex ()
{
  echo $1 | hexdump
}

gimme () {
	grep -HrnIi --color=always $1 .
}

ultraflip()
{
	echo " ┻━┻ ︵╰(°□°)╯︵ ┻━┻";
}