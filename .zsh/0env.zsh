export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export IPFS_PATH="$XDG_DATA_HOME"/ipfs
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine
export FFMPEG_DATADIR="$XDG_CONFIG_HOME"/ffmpeg
export GOPATH="$XDG_DATA_HOME"/go
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export KDEHOME="$XDG_CONFIG_HOME"/kde
export PYENV_ROOT=$XDG_DATA_HOME/pyenv

export TEXMFHOME=$XDG_DATA_HOME/texmf
export TEXMFVAR=$XDG_CACHE_HOME/texlive/texmf-var
export TEXMFCONFIG=$XDG_CONFIG_HOME/texlive/texmf-config

export EDITOR=nvim

export PUB_HOSTED_URL=https://mirror.sjtu.edu.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://mirror.sjtu.edu.cn

