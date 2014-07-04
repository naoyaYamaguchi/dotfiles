echo 'read .zprofile'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory extendedglob
bindkey -e
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename 

# 補完系
autoload -Uz compinit
compinit
# End of lines added by compinstall


PROMPT="%n@%l'%U%m%u[0]:%4~%# "
RPROMPT="%1(v|%F{green}%1v%f|)"
SPROMPT='zsh: replace '\''%R'\'' to '\''%r'\'' ? [Yes/No/Abort/Edit] '

# show branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
precmd () {
    psvar=()
    vcs_info
    [[ -n $vcs_info_msg_0_ ]] && psvar[1]="$vcs_info_msg_0_"
}
