## Summary
magento2box is a Vagrant image based on Rasmus Lerdorf's [php7dev](https://github.com/rlerdorf/php7dev) Vagrant image. It comes preconfigured with PHP 7, Nginx, MySQL 5.6 and a base install of the Magento 2.

## Installation

Download and install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

Download and install [Vagrant](https://www.vagrantup.com/downloads.html)

Make sure you are at least at Vagrant version 1.5 or the steps below may not work for you.

Otherwise for UNIX and UNIX-like users just clone and go. Like this: 

```
$ git clone git@github.com:RMcLeod79/magento2dev.git
...
$ cd magento2dev
...
$ vagrant box add magento2 magento2.box
...
$ vagrant up
```

Add this to your hosts file:

```
192.168.7.7 magento2.dev
```

There are also various vagrant plugins that can help you update your dns. See [local-domain-resolution](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins#local-domain-resolution).  

At this point you should be able to point your  browser at:

```
http://magento2.dev/
```

and it should show the Magento 2 Store home page.


## Server Setup
The Magento2 files can be found in ./htdocs these are shared to /var/www/magento2 on the guest machine

All passwords on the server (sudo, MySQL root etc.) are vagrant
