#!/bin/bash

MODULE_NAME="turret"
WEB_UI_PORT=19091
WEB_UI_USERNAME="gdturret"
WEB_UI_PASSWORD="gdturret"

build()
{
  docker build -t "fantasy4z/$MODULE_NAME" .
}

run()
{
  docker run -d --name "$MODULE_NAME" -p 19091:9091 -p 51413:51413 -p 51413:51413/udp \
      -v "$HOME/gdrive/downloads:/downloads" \
      "fantasy4z/$MODULE_NAME" "${WEB_UI_USERNAME}" "${WEB_UI_PASSWORD}"
}

main()
{
  case "$1" in
    "build")
      build
      ;;
    "run")
      run
      ;;
    *)
      echo "Unknown command: $1. Aborted"
      exit 1
  esac
}

main "$@"
