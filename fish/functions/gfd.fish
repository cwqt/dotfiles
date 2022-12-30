function gfd
  git checkout (git branch --sort=-committerdate --format='%(refname:short)'  | fzf)
end
