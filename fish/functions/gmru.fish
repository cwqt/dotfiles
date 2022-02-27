function gmru --wraps='git branch --sort=-committerdate' --description 'alias gmru=git branch --sort=-committerdate'
  git branch --sort=-committerdate $argv; 
end
