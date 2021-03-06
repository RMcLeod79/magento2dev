#!/bin/bash
if [ -d "magento2" ]; then
    echo "Magento is already installed, run vagrant up"
    exit 1
fi

echo "Creating PHP7 dev environment"
mkdir php7
echo "<?php" > php7/index.php
echo "phpinfo();" >> php7/index.php

echo "Cloning Magento 2, this can take a while!"
git clone -b develop git@github.com:magento/magento2.git magento2

cd magento2 && composer install --ignore-platform-reqs

echo "Now run vagrant up and vagrant ssh"
echo "Once logged into the VM run ./install.sh"
