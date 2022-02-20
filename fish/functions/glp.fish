function glp
  if ! [ -z $1 ]; then
    git log --pretty=$1
  end
end
