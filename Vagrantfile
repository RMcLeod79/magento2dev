# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

    config.vm.box = "magento2"
    config.vm.network  "private_network", ip: "192.168.7.7"
    config.vm.hostname = "magento2"
    config.vm.synced_folder "htdocs", "/var/www/magento2", :mount_options => ["dmode=770", "fmode=770"], group: "www-data"

end
