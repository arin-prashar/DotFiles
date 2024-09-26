# My dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system<br>
**These are for debian based**

### Git

```
apt install git
```

### Stow

```
apt install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com:arin-prashar/DotFiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```

