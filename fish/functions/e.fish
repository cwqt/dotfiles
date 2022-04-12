function _e_cd
  nvm use lts/fermium
  cd ~/code/ecologi/core/$argv
end

function e
  if not set -q argv[1]; echo "Missing target"; return 1; end

  if [ $argv[1] = "sb"    ]; _e_cd; yarn workspace @ecologi/react-components storybook; return 0; end
  if [ $argv[1] = "api"   ]; _e_cd /api; yarn workspace ecologi-api dev; return 0; end
  if [ $argv[1] = "fe"    ]; _e_cd /web-client; yarn workspace web-client dev;return 0;  end 
  if [ $argv[1] = "admin" ]; _e_cd; yarn workspace admin-panel dev; return 0; end

  echo "Unrecognised target"
  return 1;
end
