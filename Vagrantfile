# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

    config.vm.box = "rmcleod/magento2dev"
    config.vm.network  "private_network", ip: "192.168.7.7"
    config.vm.hostname = "magento2"
    config.vm.synced_folder "magento2", "/var/www/magento2", :mount_options => ["dmode=770", "fmode=770"], group: "www-data"
    config.vm.synced_folder "php7", "/var/www/php7", :mount_options => ["dmode=770", "fmode=660"], group: "www-data"

end
