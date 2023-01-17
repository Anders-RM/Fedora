#! /bin/bash
dnf update -y; dnf upgrade -y
dnf install zsh -y
dnf install git -y
dnf install powerline-fonts -y
dnf install yakuake -y
dnf remove firefox -y
dnf config-manager --set-enabled google-chrome
dnf update -y
dnf install google-chrome-stable -y
#hyper
rpm -i https://releases.hyper.is/download/rpm
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
dnf check-update
dnf install -y code

#ohmyzsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

chsh -s $(which zsh)curl

Google Chrome