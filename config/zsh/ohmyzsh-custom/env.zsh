# MacOS specific path
if [[ "$OSTYPE" == "darwin"* ]]; then
  # Include rancher-desktop bin folder (include docker, kubectl etc.)
  export PATH="$HOME/.rd/bin:$PATH"
  # Include binaries installed by bun
  export PATH="$HOME/.bun/bin:$PATH"
fi

aqua_path=${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin
export PATH="$PATH:$aqua_path"
export AQUA_GLOBAL_CONFIG=$HOME/.config/aqua.yaml
