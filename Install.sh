#!/bin/bash
if ["$(whoami)" == "root"]
user = "Username here" 
then 
echo Root check passed Make sure this is sudo
cd $user/Downloads/
curl -fsSL https://rpm.librewolf.net/librewolf-repo.repo | pkexec tee /etc/yum.repos.d/librewolf.repo
dnf install librewolf -y
echo installing RPMs
curl -Lo GoogleChrome.rpm https://www.google.com/chrome/next-steps.html?platform=linux&statcb=0&installdataindex=empty&defaultbrowser=0#
curl -Lo vencord.rpm https://vencord.dev/download/vesktop/amd64/rpm
dnf install vencord.rpm -y
dnf install GoogleChrome.rpm -y
echo installing flatpaks
flatpak install flathub --system org.libreoffice.LibreOffice -y
flatpak install flathub --system org.kde.audiotube -y
flatpak install flathub --system org.mozilla.Thunderbird -y
flatpak install flathub --system io.missioncenter.MissionCenter -y
echo installing Zed
curl -Lo zed.tar.gz https://zed.dev/api/releases/stable/latest/zed-linux-x86_64.tar.gz
tar -xvf zed.tar.gz -C $user/.local
ln -sf $user/.local/zed.app/bin/zed $user/.local/bin/zed
cp $user/.local/zed.app/share/applications/zed.desktop $user/.local/share/applications/dev.zed.Zed.desktop
sed -i "s|Icon=zed|Icon=$HOME/.local/zed.app/share/icons/hicolor/512x512/apps/zed.png|g" $user/.local/share/applications/dev.zed.Zed.desktop
sed -i "s|Exec=zed|Exec=$HOME/.local/zed.app/libexec/zed-editor|g" $user/.local/share/applications/dev.zed.Zed.desktop
echo installing QT Creator
curl -Lo QTCreator.run https://d13lb3tujbc8s0.cloudfront.net/onlineinstallers/qt-online-installer-linux-x64-4.8.1.run
./QTCreator.run
fi 