#! /bin/bash
sudo dnf upgrade -y
sudo dnf update -y
sudo dnf install git -y
sudo dnf install powerline-fonts -y
sudo dnf install yakuake -y
sudo dnf install python-pip python-devel -y
sudo dnf install xrdp -y
sudo systemctl enable xrdp
sudo systemctl start xrdp
sudo chcon --type=bin_t /usr/sbin/xrdp
sudo chcon --type=bin_t /usr/sbin/xrdp-sesman

#VSCode
cat <<EOF | sudo tee /etc/yum.repos.d/vscode.repo
[code]
name=Visual Studio Code
baseurl=https://packages.microsoft.com/yumrepos/vscode
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
sudo dnf install -y code

#Edge
cat <<EOF | sudo tee /etc/yum.repos.d/microsoft-edge.repo
[microsoft-edge]
name=microsoft-edge
baseurl=https://packages.microsoft.com/yumrepos/edge
enabled=1
gpgcheck=1
gpgkey=https://packages.microsoft.com/keys/microsoft.asc
EOF
sudo dnf install microsoft-edge-stable -y

#thefuck
sudo pip install thefuck

#git config
ssh-keygen -q -t rsa -N '@Ndersraeder' -f ~/.ssh/id_rsa -C "andersrm1808@gmial.com" <<<y >/dev/null 2>&1
git config --global user.email "andersrm1808@gmial.com"
git config --global user.name "anddersrm1808"

#ohmyzsh
sudo dnf install zsh -y
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

sudo mv MesloLGS\ NF\ Bold\ Italic.ttf /usr/share/fonts/
sudo mv MesloLGS\ NF\ Bold.ttf /usr/share/fonts/
sudo mv MesloLGS\ NF\ Regular.ttf /usr/share/fonts/
sudo mv MesloLGS\ NF\ Italic.ttf /usr/share/fonts/

mv .zshrc ~
mv .p10k.zsh ~

#other
lookandfeeltool -a org.kde.breezedark.desktop
kwriteconfig5 --file ~/.config/kcminputrc --group Mouse --key cursorTheme Adwaita
mkdir -p ~/.config/autostart
mv /usr/share/applications/org.kde.yakuake.desktop ~/.config/autostart/org.kde.yakuake.desktop
mv Anders.profile ~/.local/share/konsole/Anders.profile
mv konsolerc ~/.config/konsolerc
mv yakuakerc ~/.config/yakuakerc
mkdir -p ~/.local/share/kservices5/ServiceMenus
mv open_as_root.desktop ~/.local/share/kservices5/ServiceMenus
mv dolphinrc ~/.config/dolphinrc
sudo mv plasma-org.kde.plasma.desktop-appletsrc ~/.config/plasma-org.kde.plasma.desktop-appletsrc

sudo chsh -s $(which zsh)
chsh -s $(which zsh)

#logout
qdbus org.kde.ksmserver /KSMServer org.kde.KSMServerInterface.logout 0 3 3