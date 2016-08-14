#!/bin/bash

main()
{
  local download_dir="$1"

  if [[ -z "$download_dir" ]] || [[ ! -d "$download_dir" ]]; then
    download_dir="/gdrive/downloads"
    if [[ ! -d "$download_dir" ]]; then
      download_dir="$HOME/gdrive/downloads"
      if [[ ! -d "$download_dir" ]]; then
        echo "$download_dir does not exist. Exit."
        exit 1
      fi
    fi
  fi

  echo "start to listen to filesystem events of $download_dir."
  while true
  do
    inotifywait -e close_write,moved_to,create,delete "$download_dir" |
    while read -r directory events filename; do
      echo "filesystem event: $events on $filename. Trigger drive to push."
      drive push -no-prompt "$download_dir"
      if [[ $? -ne 0 ]]; then
        echo "ERROR: Failed to push $download_dir."
      else
        echo "Push $download_dir successfully."
      fi
    done
  done
}

main "$@"
