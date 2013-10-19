# Update 2013.10.20  Shoes Alias ADD
# Update 2013.10.1  SublimeTextのパッケージディレクトリの環境変数の作成
# Update 2013.9.29  シークレットファイルの実行追加
# Update 2013.9.29  パスの追加
# Update 2013.9.29  zsh-completionsのパス変更
# Update 2013.9.29  zsh-syntax-highlightingの読み込み
# Update 2013.9.9   エイリアスの追加（titanium ios 実機ビルド）
# Update 2013.9.9   エイリアスの追加（iossim起動）
# Update 2013.9.7


#######################################
# 基本
#######################################
export LANG=ja_JP.UTF-8
export LESSCHARSET=utf-8
export TERM=xterm-256color
setopt auto_cd          # cdコマンドなしで移動
setopt auto_pushd       # 移動したディレクトリを記録



#######################################
# History
#######################################
HISTFILE=~/.zsh_history   # ヒストリを保存するファイル
HISTSIZE=10000            # メモリに保存されるヒストリの件数
SAVEHIST=10000            # 保存されるヒストリの件数
setopt bang_hist          # !を使ったヒストリ展開を行う(d)
setopt extended_history   # ヒストリに実行時間も保存する
setopt hist_ignore_dups   # 直前と同じコマンドはヒストリに追加しない
setopt share_history      # 他のシェルのヒストリをリアルタイムで共有する
setopt hist_reduce_blanks # 余分なスペースを削除してヒストリに保存する



#######################################
# 補完関係
#######################################
# zsh-completionsの追加
fpath=(~/.zsh/zsh-completions/src $fpath)
autoload -U compinit; compinit # 補完機能を有効にする
setopt auto_list               # 補完候補を一覧で表示する(d)
setopt auto_menu               # 補完キー連打で補完候補を順に表示する(d)
setopt list_packed             # 補完候補をできるだけ詰めて表示する
setopt list_types              # 補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete  # Shift-Tabで補完候補を逆順する("\e[Z"でも動作する)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完時に大文字小文字を区別しない



#######################################
# Prompt
#######################################
autoload colors
colors
PROMPT="[${USER}@${HOST%%.*}] > "
RPROMPT=$GREEN'[%~]'$WHITE
setopt transient_rprompt

#######################################
# ターミナルのタイトルを変更
#######################################
case "${TERM}" in
kterm*|xterm*)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac


#######################################
# Color
#######################################
# 色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
# 補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
# ZLS_COLORSとは？
export ZLS_COLORS=$LS_COLORS
# lsコマンド時、自動で色がつく(ls -Gのようなもの？)
export CLICOLOR=true
# 補完候補に色を付ける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}



#######################################
# Alias
#######################################
if which pbcopy >/dev/null 2>&1 ; then 
    # Mac  
    alias -g C='| pbcopy'
elif which xsel >/dev/null 2>&1 ; then 
    # Linux
    alias -g C='| xsel --input --clipboard'
elif which putclip >/dev/null 2>&1 ; then 
    # Cygwin 
    alias -g C='| putclip'
fi

alias his='history'
alias p='pwd'
alias e='echo'
alias v='vim'
alias t='tree'
alias c='cat -n'
alias l='ls -a'

alias vi='vim'
alias ll='ls -al'
alias log='tail -f 5'
alias g='git'
alias gs='git status'
alias gl='git log'
alias rm='rm -i'

# sublime
alias s="subl"

# ios simulator
alias simulator="open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app"

# Titanium
alias tii="titanium build -p ios"
alias tis="tishadow run"
alias tiiios='titanium build -T device --platform iphone -V "Keitarou Oonishi" -P "675C4128-7335-4ABC-BEB3-C0B2F608A3CB"'

# Bundle
alias b="bundle"
alias be="bundle exec"
# Version
alias version='php -v'

# sedをgnu-sedに変更
alias sed='gsed'

#nvm
source ~/.nvm/nvm.sh
nvm use "v0.8.22"

# Ruby
alias shoes="/Applications/Shoes.app/Contents/MacOS/shoes"

#######################################
# zsh-syntax-highlightingの読み込み
#######################################
if [ -f ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  echo "not find zsh-syntax-highlighting.zsh"
fi

#######################################
# zsh-syntax-highlightingの読み込み
#######################################
# if [ -f ~/.zsh/zsh-git-prompt/zshrc.sh ]; then
  # source ~/.zsh/zsh-git-prompt/zshrc.sh
  # PROMPT='%B%m%~%b$(git_super_status) %#'
# else
  # echo "not find zsh-git-prompt"
# fi

#######################################
# ネタ
#######################################
alias ramen3="sleep 180 && terminal-notifier -message "ラーメンできたよ！" && while true; do sleep 1 && say ラーメンできたよ!; done;"
alias ramen4="sleep 240 && terminal-notifier -message "ラーメンできたよ！" && while true; do sleep 1 && say ラーメンできたよ!; done;"
alias ramen5="sleep 300 && terminal-notifier -message "ラーメンできたよ！" && while true; do sleep 1 && say ラーメンできたよ!; done;"
alias ramen="ramen3"

#######################################
# パスの追加
#######################################
export PATH="/Users/keitarou/.original_shells/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"


#######################################
# ちょっとした環境変数の追加
#######################################
export SUBL_PACKAGES="~/Library/Application Support/Sublime Text 2/Packages"

#######################################
# 公開したくない設定の読み込み
#######################################
source ~/.zsh_secret
