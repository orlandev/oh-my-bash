#! bash oh-my-bash.module
# ------------------------------------------------------------------#
#          FILE: mbriggs.zsh-theme                                  #
#            BY: Matt Briggs (matt@mattbriggs.net)                  #
#      BASED ON: smt by Stephen Tudor (stephen@tudorstudio.com)     #
# ------------------------------------------------------------------#

SCM_THEME_PROMPT_DIRTY="${red}⚡${reset_color}"
SCM_THEME_PROMPT_AHEAD="${red}!${reset_color}"
SCM_THEME_PROMPT_CLEAN="${green}✓${reset_color}"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=""
GIT_SHA_PREFIX=" ${yellow}"
GIT_SHA_SUFFIX="${reset_color}"

function git_short_sha() {
  SHA=$(git rev-parse --short HEAD 2> /dev/null) && echo "$GIT_SHA_PREFIX$SHA$GIT_SHA_SUFFIX"
}

function _omb_theme_PROMPT_COMMAND() {
    local return_status=""
    local ruby="${red}$(_omb_prompt_print_ruby_env)${reset_color}"
    local user_host="${green}\h${reset_color}"
    local current_path="\w"
    local n_commands="\!"
    local git_branch="$(git_short_sha)$(scm_prompt_info)"
    local prompt_symbol='λ'
    local open='('
    local close=')'
    local prompt_char=' \$ '

    PS1="\n${n_commands} ${user_host} ${prompt_symbol} ${ruby} ${open}${current_path}${git_branch}${close}${return_status}\n${prompt_char}"
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
