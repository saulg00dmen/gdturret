#!/bin/bash

MODULE_NAME="drive"

build()
{
  docker build -t fantasy4z/"$MODULE_NAME" .
}

run()
{
  docker run -d --name "$MODULE_NAME" -v "$HOME/gdrive:/gdrive" "fantasy4z/$MODULE_NAME"
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
