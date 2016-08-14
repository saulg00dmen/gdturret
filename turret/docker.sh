#!/bin/bash

MODULE_NAME="turret"

build()
{
  docker build -t "fantasy4z/$MODULE_NAME" .
}

run()
{
  docker run -d --name "$MODULE_NAME" --network=host \
    -v "$HOME/gdrive/downloads:/downloads" "fantasy4z/$MODULE_NAME"
}

main()
{
  if [[ "$1" == "build" ]]; then
    build "$@"
  elif [[ "$1" == "run" ]]; then
    run "$@"
  else
    echo "Unknown command: $1"
    exit 1
  fi
}

main "$@"
