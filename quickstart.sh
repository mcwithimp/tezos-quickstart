echo ============================
echo thanks for tezos-south-asia
echo ============================

sudo apt update -y
sudo apt install -y wget
wget https://gitlab.com/tezos-southeast-asia/tezosinstaller/raw/master/install.sh -O install.sh
sudo chmod 755 install.sh
sudo ./install.sh carthagenet
tezos-node identity generate
sudo apt update -y
sudo apt install -y gzip jq screen
export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y
