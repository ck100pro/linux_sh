# 載入衍生 sh 檔
source ./style/color.sh

printf "${LIGHT_RED}----- [1/10] 系統更新 -----${NC}\n"
sudo apt-get update && sudo apt-get upgrade -y

printf "${LIGHT_RED}----- [2/10] 安裝 Zsh Terminal -----${NC}\n"
sudo apt-get install zsh -y

printf "${LIGHT_RED}----- [3/10] 下載 oh-my-zsh -----${NC}\n"
if [ -d ${HOME}/.config/ezsh/oh-my-zsh ]; then
  printf "${YELLOW}oh-my-zsh 已經安裝在 ${HOME}/.config/ezsh 目錄底下${NC}\n"
else
  git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.config/ezsh/oh-my-zsh
fi

printf "${LIGHT_RED}----- [4/10] 下載 asdf -----${NC}\n"
if [ -d ${HOME}/.asdf ]; then
  printf "${YELLOW}asdf 已經安裝在 ${HOME} 目錄底下${NC}\n"
else
  git clone --depth=1 https://github.com/asdf-vm/asdf.git ~/.asdf
fi

printf "${LIGHT_RED}----- [5/10] 下載字體 Nerd Fonts version of Hack, Roboto Mono, DejaVu Sans Mono -----${NC}\n"

wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/RobotoMono/Regular/complete/Roboto%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/
wget -q --show-progress -N https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DejaVuSansMono/Regular/complete/DejaVu%20Sans%20Mono%20Nerd%20Font%20Complete.ttf -P ~/.fonts/

printf "${LIGHT_RED}----- [6/10] 安裝字體 Nerd Fonts version of Hack, Roboto Mono, DejaVu Sans Mono -----${NC}\n"
fc-cache -fv ~/.fonts

printf "${LIGHT_RED}----- [7/10] 複製設定檔 -----${NC}\n"
printf "${LIGHT_BLUE}複製 .zshrc 到 ${HOME}${NC}\n"
cp -f .zshrc ~/
printf "${LIGHT_BLUE}複製 ezsh.zsh 到 ${HOME}/.config/ezsh${NC}\n"
cp -f ezsh.zsh ~/.config/ezsh

printf "${LIGHT_GREEN}----- 下載/更新: oh-my-zsh 衍生套件 zsh-syntax-highlighting -----${NC}\n"
if [ -d ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
  cd ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting && git pull --rebase
else
  git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.config/ezsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
fi

printf "${LIGHT_GREEN}----- 下載/更新: oh-my-zsh 衍生套件 zsh-autosuggestions -----${NC}\n"
if [ -d ~/.config/ezsh/oh-my-zsh/plugins/zsh-autosuggestions ]; then
  cd ~/.config/ezsh/oh-my-zsh/plugins/zsh-autosuggestions && git pull --rebase
else
  git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.config/ezsh/oh-my-zsh/plugins/zsh-autosuggestions
fi

printf "${LIGHT_GREEN}----- 下載/更新: oh-my-zsh 衍生套件 asdf -----${NC}\n"
if [ -d ~/.config/ezsh/oh-my-zsh/plugins/asdf ]; then
  cd ~/.config/ezsh/oh-my-zsh/plugins/asdf && git pull --rebase
else
  git clone --depth=1 https://github.com/asdf-vm/asdf.git ~/.config/ezsh/oh-my-zsh/plugins/asdf
fi

printf "${LIGHT_GREEN}----- 下載/更新: oh-my-zsh 衍生套件 powerlevel10k -----${NC}\n"
if [ -d ~/.config/ezsh/oh-my-zsh/custom/themes/powerlevel10k ]; then
  cd ~/.config/ezsh/oh-my-zsh/custom/themes/powerlevel10k && git pull --rebase
else
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/ezsh/oh-my-zsh/custom/themes/powerlevel10k
fi

printf "${LIGHT_PURPLE}----- 設定 zsh 為主終端機 -----${NC}\n"
chsh -s /bin/zsh
