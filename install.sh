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


echo -e "${LIGHT_RED}[1/10]----- 系統更新 -----${NC}"
sudo apt-get update
sudo apt-get upgrade

echo -e "${LIGHT_RED}----- [2/10] 安裝 Zsh Terminal -----${NC}"
sudo apt-get install zsh -y

echo -e "${LIGHT_RED}----- [3/10]下載 oh-my-zsh -----${NC}"
if [ -d ${HOME}/.config/ezsh/oh-my-zsh ]; then
  echo -e "${YELLOW}oh-my-zsh 已經安裝在 ${HOME}/.config/ezsh 目錄底下${NC}\n"
else
  git clone --depth=1 git@github.com:ohmyzsh/ohmyzsh.git ~/.config/ezsh/oh-my-zsh
fi

echo -e "${LIGHT_RED}----- [4/10]下載 asdf -----${NC}"
if [ -d ${HOME}/.asdf ]; then
  echo -e "${YELLOW}oh-my-zsh 已經安裝在 ${HOME} 目錄底下${NC}\n"
else
  git clone --depth=1 https://github.com/asdf-vm/asdf.git ~/.asdf
fi

echo -e "${LIGHT_RED}----- [5/10]複製設定檔 -----${NC}"
echo -e "${LIGHT_BLUE}複製 .zshrc 到 ${HOME}${NC}"
cp -f .zshrc ~/
echo -e "${LIGHT_BLUE}複製 ezsh.zsh 到 ${HOME}/.config/ezsh${NC}"
cp -f ezsh.zsh ~/.config/ezsh

echo -e "${LIGHT_GREEN}----- 下載/更新 => oh-my-zsh 衍生套件 zsh-syntax-highlighting -----${NC}"
if [ -d ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    cd ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull --rebase
else
    git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

echo -e "${LIGHT_GREEN}----- 下載/更新 => oh-my-zsh 衍生套件 zsh-autosuggestions -----${NC}"
if [ -d ~/.config/ezsh/oh-my-zsh/plugins/zsh-autosuggestions ]; then
    cd ~/.config/ezsh/oh-my-zsh/plugins/zsh-autosuggestions && git pull --rebase
else
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.config/ezsh/oh-my-zsh/plugins/zsh-autosuggestions
fi

echo -e "${LIGHT_GREEN}----- 下載/更新 => oh-my-zsh 衍生套件 asdf -----${NC}"
if [ -d ~/.config/ezsh/oh-my-zsh/plugins/asdf ]; then
    cd ~/.config/ezsh/oh-my-zsh/plugins/asdf && git pull --rebase
else
    git clone --depth=1 https://github.com/asdf-vm/asdf.git ~/.config/ezsh/oh-my-zsh/plugins/asdf
fi

# 字體安裝

echo -e "${LIGHT_RED}----- [6/10]下載字體 Nerd Fonts version of Hack, Roboto Mono, DejaVu Sans Mono -----${NC}"

wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/

echo -e "${LIGHT_RED}----- [7/10]安裝字體 -----${NC}"
fc-cache -fv ~/.fonts

if [ -d ~/.config/ezsh/oh-my-zsh/custom/themes/powerlevel10k ]; then
    cd ~/.config/ezsh/oh-my-zsh/custom/themes/powerlevel10k && git pull
else
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/ezsh/oh-my-zsh/custom/themes/powerlevel10k
fi

