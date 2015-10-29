## Summary
magento2box is a Vagrant image based on Rasmus Lerdorf's [php7dev](https://github.com/rlerdorf/php7dev) Vagrant image. It comes preconfigured with PHP 7, Nginx, MySQL 5.6 and a base install of the Magento 2.

## Installation

Download and install [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

Download and install [Vagrant](https://www.vagrantup.com/downloads.html)

```
$ git clone git@github.com:RMcLeod79/magento2dev.git
...
$ cd magento2dev
...
$ ./setup.sh
...
$ vagrant up
...
$ vagrant ssh
...
$ ./install.sh
```

Add this to your hosts file:

```
192.168.7.7 magento2.dev
192.168.7.7 php7.dev
```

There are also various vagrant plugins that can help you update your dns. See [local-domain-resolution](https://github.com/mitchellh/vagrant/wiki/Available-Vagrant-Plugins#local-domain-resolution).  

At this point you should be able to point your browser at:

```
http://magento2.dev/
```

and it should show the Magento 2 Store home page.

```
http://php7.dev/
```

and it should show the PHP info page.

## Vagrant Up fails with Warning: Authentication failure. Retrying...

If this happens hit `ctrl+c` make a note of the port number vagrant mapped for ssh (usually 2222) and manually ssh into the VM the password is vagrant

```
ssh -p 2222 vagrant@127.0.0.1
```

Once you're logged into the VM run the following:

```
wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O .ssh/authorized_keys
chmod 700 .ssh
chmod 600 .ssh/authorized_keys
chown -R vagrant:vagrant .ssh
logout
```

Now run `vagrant halt` this will replace the key with a safe one. Now run `vagrant up` and everything should be fine. Don't forget to run `vagrant ssh` followed by `./install.sh` to install Magento2.

## Server Setup
The Magento2 files can be found in `./magento2` these are shared to `/var/www/magento2` on the guest machine
The PHP7 files can be found in `./php7` these are shared to `/var/www/php7` on the guest machine

All passwords on the server (sudo, MySQL root etc.) are vagrant

## Magento 2 bug
When you try to login to the admin you will get an error, this error is something to do with config cache. To get round it:
```
$ vagrant ssh
...
$ cd /var/www/magento2
...
$ rm -rf var/cache
```
Now refresh the admin page and you will see the dashboard. Try navigating to System -> Cache and you will get the same error again. Remove the cache folder again and refresh you will now see the cache settings, disable config cache and the problem goes away.

The problem is to do with when Magento tries to unserialize the cache data, feel free to find a fix and PR it to [Magento](https://github.com/magento/magento2)

## Update PHP 7 to the most recent commit
SSH into the VM `vagrant ssh`

```
$ makephp 7
...
$ sudo service php-fpm restart
```

## Swith PHP Version
PHP 5.3, 5.4, 5.5 and 5.6 are also available and can easily be switched to.

SSH into the VM `vagrant ssh`

```
$ newphp 56
Activating PHP 5.6.13 and restarting php-fpm
```
