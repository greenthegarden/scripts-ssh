#!/usr/bin/env bash

export key_algorithm="ed25519" # one of rsa, dsa, ecdsa, ed25519
export key_size="4096"
export key_comment=""
export key_file="id_${key_algorithm}"
export key_file_dir="${HOME}/.ssh"
