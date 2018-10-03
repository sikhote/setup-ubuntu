echo 'app-get'
sudo apt-get install git
sudo apt-get install chromium

echo 'git'
git config --global user.name "David Sinclair"
git config --global user.email "david@sinclair.tech"

echo 'hyper'
wget https://releases.hyper.is/download/deb -O ~/Downloads/hyper.deb
sudo apt-get install ~/Downloads/hyper.deb
rm -rf ~/Downloads/hyper.deb

echo 'flatpak'
sudo add-apt-repository ppa:alexlarsson/flatpak
sudo apt update
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo 'flatpak apps'
flatpak install flathub io.atom.Atom
flatpak install flathub com.dropbox.Client
flatpak install flathub org.videolan.VLC
flatpak install flathub com.transmissionbt.Transmission
flatpak install flathub com.getpostman.Postman

echo 'nvm'
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bash_profile
nvm install 8
nvm alias default 8

echo 'yarn'
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update
sudo apt-get install --no-install-recommends yarn

echo 'bash-git-prompt'
git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1

echo "projects"
mkdir -p ~/Projects

echo "awscli"
sudo apt-get install python-pip
pip install awscli --upgrade --user

echo 'bash_profile'
yes | cp bash_profile ~/.bash_profile
yes | cp Solarized_Extravagant.bgptheme /usr/local/opt/bash-git-prompt/share/themes/Solarized_Extravagant.bgptheme

echo 'fonts'
yes | cp fonts/* ~/usr/local/share/fonts
sudo fc-cache -fv

echo 'atom'
apm install --packages-file atom/packages.txt
yes | cp atom/config.cson ~/.atom/config.cson
yes | cp atom/styles.less ~/.atom/styles.less

echo 'hyper'
yes | cp hyper.js ~/.hyper.js

echo 'desktop'
yes | cp desktop.jpg ~/Pictures
