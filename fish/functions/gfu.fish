function gfu --wraps='git add .;git commit -m "fix: fixup";git commit --fixup $(git rev-parse --short HEAD) .;git rebase --autosquash HEAD~2' --description 'alias gfu=git add .;git commit -m "fix:fixup";git commit --fixup $(git rev-parse --short HEAD) .;git rebase --autosquash HEAD~2'
  git add .;git commit -m "fix: fixup";git commit --fixup $(git rev-parse --short HEAD) .;git rebase --autosquash HEAD~2 $argv; 
end
