#!/bin/bash

check_active () {
  if [[ $1 == "*"* ]]; then
    echo 1
  else
    echo 0
  fi
}

while getopts "w:" opt; do
  case $opt in
    w)
      STATE=$(eww windows | awk -v win=$OPTARG '$0 ~ win"$" {print $0}')
      check_active $STATE
      ;;
    *)
      echo "Invalid flag. Please use w and pass eww window name"
      ;;
  esac
done