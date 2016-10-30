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
