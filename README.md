This repo uses a VirtualBox box.

## Usage

Assuming you have the latest version of VirtualBox and Vagrant installed:

1. Clone this repository:
```bash
git clone git@github.com:dtgoitia/vagrant-ubuntu-python3.git my-project
cd ./my-project
```
2. Install the vagrant box:
```bash
vagrant up
```
3. Provision the vagrant box:
```bash
vagrant provision
```
4. Connect to the Vagrant box:
```bash
vagrant ssh
```

## Installed packages

See `./bootstrap.sh` for further detail.

## SSH

Ensure your `~/.ssh/config` file has:

```
Host abot
  HostName localhost
  Port 2222
  User vagrant

Host *
  ControlMaster auto
  ControlPath ~/.ssh/sockets/%r@%h-%p   <-- remove this line
  ControlPersist 600
  ServerAliveInterval 60
  ServerAliveCountMax 3
```
