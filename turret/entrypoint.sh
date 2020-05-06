#!/bin/bash

USERNAME="gdturret"
PASSWORD="gdturret"
DEFAULT_SETTINGS_JSON="/etc/transmission-daemon/settings.json"
CONFIG_DIR="/root/.config/transmission-daemon"
SETTINGS_JSON="${CONFIG_DIR}/settings.json"

main()
{
  local username="$1"
  local password="$2"
  [[ -z "${username}" ]] && username="${USERNAME}"
  [[ -z "${password}" ]] && password="${PASSWORD}"

  mkdir -p "${CONFIG_DIR}"
  jq '.["rpc-username"]="'${username}'" | .["rpc-password"]="'${password}'"' \
      "${DEFAULT_SETTINGS_JSON}" > "${SETTINGS_JSON}"

  /usr/bin/transmission-daemon --foreground --allowed *.*.*.* --download-dir /downloads --incomplete-dir /incompletes
}

main "$@"
