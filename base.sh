sudo apt-get update
sudo apt-get upgrade -d

echo 'git'
sudo apt-get -y install git
git config --global user.name "David Sinclair"
git config --global user.email "david@sinclair.tech"

echo 'chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i ./google-chrome*.deb
rm -rf google-chrome-stable_current_amd64.deb

echo 'flatpak'
sudo add-apt-repository ppa:alexlarsson/flatpak -y
sudo apt update
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo 'flatpak apps'
flatpak install -y flathub com.dropbox.Client
flatpak install -y flathub org.videolan.VLC
flatpak install -y flathub com.transmissionbt.Transmission
flatpak install -y flathub com.getpostman.Postman
flatpak install -y flathub com.valvesoftware.Steam

echo 'nvm'
sudo apt install -y curl
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc
nvm install 10
nvm alias default 10

echo 'yarn'
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install --no-install-recommends yarn

echo "projects"
mkdir -p ~/Projects

echo "awscli"
sudo apt-get install -y python-pip
pip install awscli --upgrade --user

echo 'bash-git-prompt'
cd ~/
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

echo 'bash'
cat ~/Downloads/setup-ubuntu-master/bash >> ~/.bashrc
yes | cp ~/Downloads/setup-ubuntu-master/Solarized_Extravagant.bgptheme ~/.bash-git-prompt/themes/Solarized_Extravagant.bgptheme
source ~/.bashrc

echo 'fonts'
cd ~/Downloads/setup-ubuntu-master
mkdir -p ~/.fonts
yes | cp fonts/* ~/.fonts/
sudo fc-cache -fv

echo 'vscode'
cd ~/Downloads/setup-ubuntu-master/
curl -o code.deb -L http://go.microsoft.com/fwlink/?LinkID=760868
sudo dpkg -i ./code.deb
rm -rf code.deb
code --install-extension blanu.vscode-styled-jsx
code --install-extension dbaeumer.vscode-eslint
code --install-extension EditorConfig.EditorConfig
code --install-extension esbenp.prettier-vscode
code --install-extension naumovs.color-highlight
code --install-extension PeterJausovec.vscode-docker
code --install-extension samverschueren.linter-xo
mkdir -p ~/.config/Code/User/snippets
yes | cp vscode/settings.json ~/.config/Code/User/
yes | cp vscode/snippets/* ~/.config/Code/User/snippets/

echo 'desktop'
cd ~/Downloads/setup-ubuntu-master/
yes | cp desktop.jpg ~/Pictures

echo 'sdk'
curl -s "https://get.sdkman.io" | bash
sdk install java
