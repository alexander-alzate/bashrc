# Load color definitions
[ -e ~/.bashrc.d/inc/named_colors.sh ] && . ~/.bashrc.d/inc/named_colors.sh

# Prints the git current branch.
git_branch_prompt () {
	local bn=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
	local clr=""

	if [ -z "${bn##prod*}" ]; then
		clr=${ASC}
	elif [ "$bn" = "master" ]; then
		clr=${SEC}
	elif [ -z "${bn##*/*}" ]; then
		clr=${LPC}
	else
		clr=${AXC}
	fi

	echo -n "\[${clr}\]${bn}\[${DPC}\]"
}

