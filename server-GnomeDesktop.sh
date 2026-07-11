# 理研のサーバーに変更
sudo sed -i 's|http://jp.archive.ubuntu.com/ubuntu|http://ftp.riken.jp/Linux/ubuntu|g' /etc/apt/sources.list.d/ubuntu.sources

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
echo "===== Install GNOME Desktop And Japanese Language Pack ====="
sudo apt install gnome-session gdm3 gnome-terminal fonts-noto-cjk language-pack-gnome-ja -y
# gnome-session（GNOMEデスクトップ環境）
# gdm3（GNOMEディスプレイマネージャ。要はログイン画面）
# gnome-terminal：GNOME標準ターミナル（他のターミナルでもOK。gnome-session はターミナルをインストールしない。）
# fonts-noto-cjk：日本語フォント（これだけでターミナル内は日本語表示できる）
# language-pack-gnome-ja（GNOMEデスクトップ向け日本語翻訳パック。language-pack-ja も依存でインストールされる）
