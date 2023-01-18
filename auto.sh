#! /bin/bash
sudo dnf upgrade -y
sudo dnf update -y
sudo dnf install git -y
sudo dnf install powerline-fonts -y
sudo dnf install yakuake -y
sudo dnf remove firefox -y

#google-chrome
cat <<EOF | sudo tee /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF
sudo dnf install google-chrome-stable -y

#VSCode
rpm --import https://packages.microsoft.com/keys/microsoft.asc
cat <<EOF | sudo tee /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
sudo dnf install -y code

#ohmyzsh
sudo dnf install zsh -y
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

mv MesloLGS\ NF\ Bold\ Italic.ttf /usr/share/fonts/
mv MesloLGS\ NF\ Bold.ttf /usr/share/fonts/
mv MesloLGS\ NF\ Regular.ttf /usr/share/fonts/
mv MesloLGS\ NF\ Bold\ Italic.ttf /usr/share/fonts/

cp .zshrc ~

sudo chsh -s $(which zsh)
chsh -s $(which zsh)

lookandfeeltool -a org.kde.breezedark.desktop
kwriteconfig5 --file ~/.config/kcminputrc --group Mouse --key cursorTheme Adwaita
cp /usr/share/applications/org.kde.yakuake.desktop ~/.config/autostart/org.kde.yakuake.desktop
cp Anders.profile ~/.local/share/konsole/Anders.profile
cp konsolerc ~/.config/konsolerc
cp yakuakerc ~/.config/yakuakerc