# 場所を日本に設定
echo "===== Set locale to Japanese (Japan) ====="
sudo locale-gen ja_JP.UTF-8
sudo localectl set-locale LANG=ja_JP.UTF-8

# タイムゾーンを日本に設定
echo "===== Set timezone to Asia/Tokyo ====="
sudo timedatectl set-timezone Asia/Tokyo

# システム更新
echo "===== apt update && upgrade ====="
sudo apt update && sudo apt upgrade -y

# GNOMEデスクトップ環境と日本語化パック
echo "===== Install GNOME Desktop minimal And Japanese Language Pack ====="
sudo apt install ubuntu-desktop-minimal language-pack-ja language-pack-gnome-ja -y
# ubuntu-desktop-minimal（Ubuntuデスクトップの最小構成）
# language-pack-ja（Ubuntuの日本語翻訳をまとめて入れるパッケージ）
# language-pack-gnome-ja（GNOMEデスクトップ向け日本語翻訳パック）

# Firefoxが文字化けするので再インストール
# （apt ではなく、snap でインストールされている）
echo "===== ReInstall Firefox ====="
sudo snap remove firefox
sudo snap install firefox

# Fcitx5-mozc のインストール
echo "===== Install Fcitx5 ====="
sudo apt install fcitx5-mozc -y
## キーボード入力に使うIMシステムを Fcitx 5 に変更
im-config -n fcitx5
## スタートアップを設定する（設定しないと GNOME が iBus を起動する）
mkdir -p ~/.config/autostart
cp /usr/share/applications/org.fcitx.Fcitx5.desktop ~/.config/autostart


# 追加アプリ
echo "===== Add Application ====="
#sudo apt install file-roller gnome-shell-extension-manager
curl -fsS https://dl.brave.com/install.sh | sh

# パッケージのゴミを削除
echo "===== Auto remove ====="
sudo apt autoremove -y

# 再起動
reboot
