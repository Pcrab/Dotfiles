export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo
if [[ `uname` == "Darwin" ]]; then
    OS="apple-darwin"
else
    OS="unknown-linux-gnu"
fi
export PATH="$RUSTUP_HOME/toolchains/stable-x86_64-$OS/bin:$PATH"

. "$CARGO_HOME/env"
