# Getting started with Vagrant and Chef
This repository is in response to questions I get about how to get started on Vagrant with chef if you plan to move to server deploys in the future.


## Prerequisites
1. Install the latest version of [Vagrant](http://www.vagrantup.com/downloads.html)
2. Install the latest version of [ChefDK](http://getchef.com/downloads/chef-dk)
3. Install the Vagrant Berkshelf plugin:

        $ vagrant plugin install vagrant-berkshelf

4. Install the Vagrant Omnibus plugin: 

        $ vagrant plugin install vagrant-omnibus

## Usage
Install the prerequisites and then read and update the Vagrantfile to set the custom json that chef will use for configuration.  I recommend changing the postgres password which you can generate with a variation of this shell command:

```bash
echo -n 'insecure_password''postgres' | openssl md5 | sed -e 's/.* /md5/'
```

## Notes
* I work for [Pythian](http://www.pythian.com) and we’re always looking for great people, but this is personal
* [Hashicorp](http://hasicorp.com) Does a lot of cool things and you should follow them and use what they make
* [Seth Vargo explains Berkshelf](https://sethvargo.com/berksfile-magic/)
* [Many thanks to Poise for excellent chef resources](https://github.com/poise/application)

## Other, similar implementations
* https://github.com/geolffreym/vagrant-chef
* https://github.com/denniswalker/vagrant-multvm
* __INSERT YOUR PULL REQUEST HERE__
