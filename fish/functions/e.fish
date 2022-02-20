function _e_cd
  nvm use lts/fermium
  cd ~/code/ecologi/core/$argv
end

function e
  if [ $argv[1] = "sb"    ]; _e_cd; yarn workspace @ecologi/react-components storybook; end
  if [ $argv[1] = "api"   ]; _e_cd /api; yarn workspace ecologi-api dev; end
  if [ $argv[1] = "fe"    ]; _e_cd /web-client; yarn workspace web-client dev; end 
  if [ $argv[1] = "admin" ]; _e_cd; yarn workspace admin-panel dev; end
end
