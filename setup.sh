# check if nix command is available
if ! command -v nix &>/dev/null; then
	echo "You need to install nix first. See https://nixos.org/download.html"
	echo ""
	echo "Probably just run: sh <(curl -L https://nixos.org/nix/install) --daemon)"
	echo ""
	exit 1
fi

echo_run() {
	echo "+ $@"
	"$@"
}

# stow home dir with configs
echo_run nix --experimental-features 'nix-command flakes' run nixpkgs#stow home
