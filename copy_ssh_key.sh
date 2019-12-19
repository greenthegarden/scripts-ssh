#!/usr/bin/env bash

source ./key_vars.sh

remote_user=${USER}

IFS=$' \t\n'

# define list as a string which contains all hosts key should be copied to
# string is converted to array later in script
remote_hosts_list="localhost"

read -p "Enter key file name [${key_file}]: " key_file_input
key_file=${key_file_input:-${key_file}}

read -p "Enter key file directory [${key_file_dir}]: " key_file_dir_input
key_file_dir=${key_file_dir_input:-${key_file_dir}}

if [ -f ${key_file_dir}/${key_file} ] ; then

  read -p "Enter remote user for hosts [${remote_user}]: " remote_user_input
  remote_user=${remote_user_input:-${remote_user}}

  read -p "Enter remote hosts (as space separated list) [${remote_hosts_list}]: " remote_hosts_list_input
  echo "${remote_hosts_list_input}"
  remote_hosts_list=${remote_hosts_list_input:-${remote_hosts_list}}
  echo ${remote_hosts_list}

  # convert hosts list to array
  remote_hosts=( ${remote_hosts_list} )
  echo ${remote_hosts[*]}

  for remote_host in "${remote_hosts[@]}"; do
    echo "Copying key file ${key_file_dir}/${key_file} to ${remote_user}@${remote_host}"
    ssh-copy-id -i ${key_file_dir}/${key_file} ${remote_user}@${remote_host}
  done

else
  echo "Key file ${key_file_dir}/${key_file} not found!"
  exit
fi
