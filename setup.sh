#!/bin/bash
if [ -d "htdocs" ]; then
    echo "Magento is already installed, run vagrant up"
    exit 1
fi

echo "Cloning Magento 2, this can take a while!"
git clone -b develop git@github.com:magento/magento2.git htdocs

cd htdocs && composer install --ignore-platform-reqs

cd ../
vagrant box add magento2 magento2.box

echo "Now run vagrant up and vagrant ssh"
echo "Once logged into the VM run ./install.sh"
