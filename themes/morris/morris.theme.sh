#! bash oh-my-bash.module

# prompt theming

# added TITLEBAR for updating the tab and window titles with the pwd
case $TERM in
	xterm*)
		TITLEBAR=$(printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}")
		;;
	screen)
		TITLEBAR=$(printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}")
		;;
	*)
		TITLEBAR=""
		;;
esac

function _omb_theme_PROMPT_COMMAND() {
	PS1="${TITLEBAR}[\u@\h \W $(scm_prompt_info)]\$ "
}

# scm theming
SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${bold_green}✓"
SCM_THEME_PROMPT_PREFIX="${green}("
SCM_THEME_PROMPT_SUFFIX="${green})${reset_color}"


_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
