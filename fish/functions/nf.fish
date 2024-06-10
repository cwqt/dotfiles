function nf --wraps=neofetch\ \|\ sed\ -r\ \"s/\\x1B\\\[\(\[0-9\]\{1,3\}\(\;\[0-9\]\{1,2\}\)\?\)\?\[mGK\]//g\" --description alias\ nf=neofetch\ \|\ sed\ -r\ \"s/\\x1B\\\[\(\[0-9\]\{1,3\}\(\;\[0-9\]\{1,2\}\)\?\)\?\[mGK\]//g\"
  neofetch | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g" $argv; 
end
