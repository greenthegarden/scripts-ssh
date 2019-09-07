#!/usr/bin/env bash

# see https://www.ssh.com/ssh/keygen for details

source ./key_vars.sh

function create_key {
  echo "generating key file ${key_file_dir}/${key_file} using ${key_algorithm} algorithm with size ${key_size}"

  ssh-keygen -t ${key_algorithm} -b ${key_size} "${key_comment_arg}" -f "${key_file_dir}/${key_file}"
  export key_file
}

read -p "Enter key algorithm [${key_algorithm}]: " key_algorithm_input
key_algorithm=${key_algorithm_input:-${key_algorithm}}

read -p "Enter key size [${key_size}]: " key_size_input
key_size=${key_size_input:-${key_size}}

read -p "Enter key comment [${key_comment}]: " key_comment_input
key_comment=${key_comment_input:-${key_comment}}
key_comment_arg=""
if [ ! -z "$key_comment+x" ] ; then
  key_comment_arg="-C $key_comment"
fi

key_file="id_${key_algorithm}"
read -p "Enter key file [${key_file}]: " key_file_input
key_file=${key_file_input:-${key_file}}

read -p "Enter key file directory [${key_file_dir}]: " key_file_dir_input
key_file_dir=${key_file_dir_input:-${key_file_dir}}

if [ ! -d ${key_file_dir} ] ; then
  mkdir -p ${key_file_dir}
fi

create_key

