#!/bin/sh
#
# initialize installation for Ansible on a given host
#
# written by: Andreas 'ads' Scherbaum <andreas@scherbaum.la>
#
# Usage:
#    ./init_host.sh <IP address> <user name>
#
# Note: NEVER use this script to init a host in an untrusted network!
#

set -e

if [ "$#" -ne 2 ];
then
    echo ""
    echo "Usage:"
    echo ""
    echo "$0 <IP address> <user name>"
    echo ""
    echo "Note: NEVER use this script to init a host in an untrusted network!"
    echo ""
    exit 1
fi

echo "scanning for ssh keys, adding keys to './known_hosts' file"
ssh-keyscan -H $1 >> ./known_hosts

echo "pinging target host"
ansible all --ask-pass --ssh-common-args='-o UserKnownHostsFile=./known_hosts' -m ping -i "$1," -u "$2"

echo "running Ansible playbook to install basic prerequisites"
ansible-playbook -i "$1," -u "$2" --ask-pass --ask-become-pass --ssh-common-args='-o UserKnownHostsFile=./known_hosts' install-ansible-prereqs.yml
