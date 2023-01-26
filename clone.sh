#!/bin/sh

echo "Cloning repositories..."

Git=$HOME/Git
mkdir $Git
cd $Git

# Personal
git clone git@github.com:zirawell/dw-configs.git
git clone git@github.com:zirawell/ios_rule_script.git

