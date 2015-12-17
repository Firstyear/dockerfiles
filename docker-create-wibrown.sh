#!/bin/bash
echo $1
sudo /usr/bin/docker create -i -t --privileged=true -h ldapkdc.example.com --name=$1 -v /home/wibrown/development:/home/wibrown/development centos_wibrown_389ds-devel:7

