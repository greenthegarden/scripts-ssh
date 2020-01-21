#!/usr/bin/env bash

# Note required the package 'xclip' to be installed

source ./key_vars.sh

remote_user=${USER}

IFS=$' \t\n'

read -p "Enter key file name [${key_file}]: " key_file_input
key_file=${key_file_input:-${key_file}}

read -p "Enter key file directory [${key_file_dir}]: " key_file_dir_input
key_file_dir=${key_file_dir_input:-${key_file_dir}}

public_key_file="${key_file_dir}/${key_file}.pub"

if [ -f ${public_key_file} ] ; then

  xclip -sel clip < ${public_key_file}

else
  echo "Key file ${public_key_file} not found!"
  exit
fi
