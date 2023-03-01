alias {py,python}="python3"
# note: for plain vim just do /vim 
alias v="nvim"
alias vim="nvim"
alias edity="vim ~/.config/yabai/yabairc"
alias starty="brew services start yabai"
alias starts="brew services start skhd"
alias stopy="brew services stop yabai"
alias stops="brew services stop skhd"
alias edits="vim ~/.config/skhd/skhdrc"
alias edity="vim ~/.config/yabai/yabairc"
alias editk="vim ~/.config/kitty/kitty.conf"
alias editz="vim ~/.zshrc"
alias sourcez="source ~/.zshrc"
source ~/.config/.hemligheter/other_aliases

checkhist () {
    history | grep $1
}

checkhistmore () {
    history | grep -B 4 -A 4 $1
}


# c development
export LD_LIBRARY_PATH="/Library/Developer/CommandLineTools/usr/lib/:$LD_LIBRARY_PATH"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood"


#c stuff
runc () {
    local file="$1"
    if test -f $file; then
        clang $file -o "${file%%.*}"
    fi
}

plugins=(git)

source $ZSH/oh-my-zsh.sh

# #python stuff
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

