#! bash oh-my-bash.module
#
# Based on 'bobby' theme with the addition of python_venv
#

SCM_THEME_PROMPT_DIRTY=" ${red}✗"
SCM_THEME_PROMPT_CLEAN=" ${green}✓"
SCM_THEME_PROMPT_PREFIX=" ${yellow}|${reset_color}"
SCM_THEME_PROMPT_SUFFIX="${yellow}|"

RVM_THEME_PROMPT_PREFIX="|"
RVM_THEME_PROMPT_SUFFIX="|"
VIRTUALENV_THEME_PROMPT_PREFIX='|'
VIRTUALENV_THEME_PROMPT_SUFFIX='|'

function _omb_theme_PROMPT_COMMAND() {
    PS1="\n${green}$(_omb_prompt_print_python_venv)${red}$(_omb_prompt_print_ruby_env) ${reset_color}\h ${orange}in ${reset_color}\w\n${yellow}$(scm_char)$(scm_prompt_info) ${yellow}→${white} "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
