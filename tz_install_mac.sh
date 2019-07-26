usage() {
  echo "Usage: $0 <alphanet|mainnet>"
}

case "$1" in
  alphanet)
    ;;
  mainnet)
    ;;
  *) usage
    exit 1
    ;;
esac

NET=$1

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" || exit 1
brew update || exit 1
brew install git gmp libev pkg-config hidapi || exit 1
xcode-select --install || exit 1
wget https://github.com/ocaml/opam/releases/download/2.0.3/opam-2.0.3-x86_64-darwin || exit 1
sudo mv opam-2.0.0-x86_64-darwin /usr/local/bin/opam || exit 1
sudo chmod a+x /usr/local/bin/opam
echo "f25a98ff5a45bd2ad7ce1b9496503c505ca8cd38525dcd11be04b9203e54cbff  /usr/local/bin/opam" | shasum -a 256 -c  
git clone https://gitlab.com/tezos/tezos.git || exit 1
cd tezos
git checkout $NET || exit 1
export OPAMNO=true
opam init --bare  || exit 1
export OPAMNO=false
make build-deps || exit 1
eval $(opam env) || exit 1
make || exit 1
echo "export PATH=~/tezos:$PATH" >> .bash_profile
echo "export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y" >> .bash_profile
export PATH=~/tezos:$PATH
export TEZOS_CLIENT_UNSAFE_DISABLE_DISCLAIMER=Y

echo "Finished!"
