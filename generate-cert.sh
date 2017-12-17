#!/bin/bash

function check_if_root {
  if [ "$EUID" -ne 0 ]
    then
      echo "Please run as root"
      exit
  fi
}

check_if_root

domain=$1

if [ -z "$domain" ];
  then
    echo "Set domain as first argument."
    exit
fi

certbot certonly --standalone -d $domain
