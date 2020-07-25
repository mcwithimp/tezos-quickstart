sudo add-apt-repository ppa:avsm/ppa || exit 1
sudo apt update || exit 1
# sudo apt install -y rsync git make m4 build-essential patch unzip wget || exit 1
# wget http://security.ubuntu.com/ubuntu/pool/main/b/bubblewrap/bubblewrap_0.2.1-1ubuntu0.1_amd64.deb || exit 1
# sudo dpkg -i bubblewrap_0.2.1-1ubuntu0.1_amd64.deb || exit 1
# wget https://github.com/ocaml/opam/releases/download/2.0.3/opam-2.0.3-x86_64-linux  || exit 1
# sudo cp opam-2.0.3-x86_64-linux /usr/local/bin/opam || exit 1
# sudo chmod a+x /usr/local/bin/opam
sudo apt install -y rsync git m4 build-essential patch unzip wget pkg-config libgmp-dev libev-dev libhidapi-dev libffi-dev opam jq || exit 1
git clone https://gitlab.com/tezos/tezos.git || exit 1
cd tezos
git checkout latest-release || exit 1
export OPAMNO=true
opam init --bare  || exit 1
eval $(opam env) || exit 1
export OPAMNO=false
sudo apt install -y libev-dev libgmp-dev pkg-config libhidapi-dev || exit 1
make build-deps || exit 1
eval $(opam env) || exit 1
make || exit 1
echo "export PATH=~/tezos:$PATH" >> ~/.bashrc
echo "export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y" >> ~/.bashrc
export PATH=~/tezos:$PATH
export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y
source ~/.bashrc

echo "Finished!"
