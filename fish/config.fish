set -U fish_user_paths /opt/homebrew/bin
set -U fish_user_paths /Users/cass/.yarn/bin $fish_user_paths
set -U fish_user_paths /Users/cass/.cargo/bin $fish_user_paths

# set go path
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# increase file table limit
ulimit -n 65536

# try and switch nvm to version listed in .nvmrc on cd
function _nvm_on_pwd --on-variable PWD
  test -e $PWD/.nvmrc && nvm use
end

set -x FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow -g "!{.git,.next,node_modules,dist,.yarn.lock}"'
set FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set -gx EDITOR nvim

alias notify='terminal-notifier -title "Terminal" -message "Done with task! Exit status: $status"'
