# vagrant-grav

vagrant-grav is a fork of the excellent
[vagrantpress](https://github.com/vagrantpress/vagrantpress/). It aims to
provide a lightweight Vagrant box for developing with
[Grav](https://getgrav.org/) and its admin plugin.

## What do I get?

- Ubuntu Trusty 16.04
- Grav 1.1.3, including admin plugin
- PHP 7

## Prerequisites

- [Vagrant](http://www.vagrantup.com/downloads.html)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

## Getting Started

Getting vagrant-grav up and running is simple! Firstly, make sure you've got the
prerequisites installed. Then follow these steps:

1. Download the project, extract it and place it somewhere appropriate.
2. Run `vagrant plugin install vagrant-hostsupdater` from command line
3. Edit `Vagrantfile` and make sure you've linked your development theme.
There's a blueprint in there so you don't have to remember the syntax.
4. `cd` into this directory and run `vagrant up`
5. Open http://grav.dev in your browser

## Optimizing performance

Slow disk access can be an issue with Vagrant in general, and this is
particularly noticeable when running Grav because of the nature of flat file
CMS's (all the content is stored in files). The most common way to remedy this
is to adjust the synced folders to be [NFS
shares](https://www.vagrantup.com/docs/synced-folders/nfs.html) instead of
[VirtualBox shared
folders](https://www.vagrantup.com/docs/synced-folders/virtualbox.html).

NFS shares are faster, but they can sometimes be a bit tricky to configure, and
we can't specify file permissions manually in our `Vagrantfile`. But fear not,
the setup *should* work more or less out of the box and file permissions isn't
an issue if you don't use the admin panel to edit content.

To set up NFS shares, simply append `type: "nfs"` to your synced_folder lines,
and remove the other named arguments.

```rb
config.vm.synced_folder ".", "/vagrant", type: "nfs"
```
