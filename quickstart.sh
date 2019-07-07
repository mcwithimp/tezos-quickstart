echo ============================================
echo thanks for tezos-south-asia and tzdutch!
echo ============================================

sudo apt update -y
sudo apt install -y wget
wget https://gitlab.com/tezos-southeast-asia/tezosinstaller/raw/master/install.sh -O install.sh
sudo chmod 755 install.sh
sudo ./install.sh mainnet
tezos-node identity generate
sudo apt update -y
sudo apt install -y liblz4-tool jq
wget -c http://quicksync.tzdutch.com/mainnet-BMKkyoQRCUHh2nLxZE4o6q3ExQDeGntNsdMKTbzq6gEXRg6HguV.full.tar.lz4
lz4 -d mainnet-BMKkyoQRCUHh2nLxZE4o6q3ExQDeGntNsdMKTbzq6gEXRg6HguV.full.tar.lz4 | tar xf -
rm mainnet-BMKkyoQRCUHh2nLxZE4o6q3ExQDeGntNsdMKTbzq6gEXRg6HguV.full.tar.lz4
tezos-node snapshot import mainnet-BMKkyoQRCUHh2nLxZE4o6q3ExQDeGntNsdMKTbzq6gEXRg6HguV.full
rm mainnet-BMKkyoQRCUHh2nLxZE4o6q3ExQDeGntNsdMKTbzq6gEXRg6HguV.full
export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y
