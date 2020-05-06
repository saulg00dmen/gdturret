#!/bin/bash

GDRIVE_DIR_PATH="$HOME/gdrive"
DOWNLOADS_DIR_NAME="downloads"
DOWNLOADS_DIR_PATH="${GDRIVE_DIR_PATH}/${DOWNLOADS_DIR_NAME}"

check_installed()
{
  which "$1" > /dev/null 2>&1
  if [[ "$?" != 0 ]]; then
    echo "$1 is not installed. Aborted"
    exit 1
  fi
}

drive_init()
{
  mkdir -p "${DOWNLOADS_DIR_PATH}"

  cd "${GDRIVE_DIR_PATH}"
  drive list > /dev/null 2>&1
  if [[ "$?" -ne 0 ]]; then
    echo "directory ${GDRIVE_DIR_PATH} not inited. Init first."
    drive init "${GDRIVE_DIR_PATH}"
  fi
}

drive_pull()
{
  cd "${GDRIVE_DIR_PATH}"
  echo "Pull files from google drive."
  drive pull "${DOWNLOADS_DIR_NAME}"
  if [[ $? != 0 ]]; then
    "Pulling files from google drive failed."
    exit 1
  fi
}

main()
{
  local curr_path="$(pwd)"

  check_installed "docker"
  check_installed "drive"

  drive_init
  drive_pull

  cd "${curr_path}/turret"
  echo "Run turret"
  docker start turret
  if [[ $? != 0 ]]; then
    ./docker.sh build
    ./docker.sh run
  fi

  cd "${curr_path}/drive"
  echo "Run drive"
  docker start drive
  if [[ $? != 0 ]]; then
    ./docker.sh build
    ./docker.sh run
  fi
}

main "$@"
