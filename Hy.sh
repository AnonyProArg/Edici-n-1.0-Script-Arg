chmod 777 Hy.sh
apt upgrade -y
apt install curl -y && apt install wget -y
bash <(curl -fsSL https://git.io/hysteria.sh)
