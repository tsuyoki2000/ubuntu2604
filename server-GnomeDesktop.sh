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
