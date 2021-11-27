# 色彩設定
Black='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT_GRAY='\033[0;37m'
DARK_GRAY='\033[1;30m'
LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHT_BLUE='\033[1;34m'
LIGHT_PURPLE='\033[1;35m'
LIGHT_CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

##
echo -e "${LIGHT_RED}[1/5]----- 系統更新 -----${NC}"
sudo apt-get update
sudo apt-get upgrade
##
echo -e "${LIGHT_RED}----- [2/5] 安裝 Zsh Terminal -----${NC}"
sudo apt-get install zsh -y

echo -e "${LIGHT_RED}----- [3/5]下載 oh-my-zsh -----${NC}"
if [ -d ${HOME}/.config/ezsh/oh-my-zsh ]; then
  echo -e "${LIGHT_GREEN}oh-my-zsh 已經安裝在 ${HOME}/.config/ezsh 目錄底下${NC}\n"
else
  git clone --depth=1 git@github.com:ohmyzsh/ohmyzsh.git ~/.config/ezsh/oh-my-zsh
fi

echo -e "${LIGHT_RED}----- [4/5]複製設定檔 -----${NC}"
echo -e "${LIGHT_BLUE}複製 .zshrc 到 ${HOME}${NC}"
cp -f .zshrc ~/
echo -e "${LIGHT_BLUE}複製 ezsh.zsh 到 ${HOME}/.config/ezsh${NC}"
cp -f ezsh.zsh ~/.config/ezsh
##
