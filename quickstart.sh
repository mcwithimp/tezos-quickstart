echo ============================
echo thanks for tezos-south-asia
echo ============================

sudo apt update -y
sudo apt install -y wget
wget https://gitlab.com/tezos-southeast-asia/tezosinstaller/raw/master/install.sh -O install.sh
sudo chmod 755 install.sh
sudo ./install.sh mainnet
tezos-node identity generate
sudo apt update -y
sudo apt install -y gzip jq screen
wget -c -O snapshot_mainnet_190709.full.gz https://gitlab.com/tezoskorea/snapshot-mainnet/raw/master/snapshot_mainnet_190709.full.gz
gzip -d snapshot_mainnet_190709.full.gz
tezos-node snapshot import snapshot_mainnet_190709.full
rm snapshot_mainnet_190709.full
export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y
