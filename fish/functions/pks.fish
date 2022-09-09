function pks --wraps='jq .scripts package.json' --description 'alias pks=jq .scripts package.json'
  jq .scripts package.json $argv; 
end
