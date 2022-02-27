# Dotfiles
These are my dotfiles, primarly focus on MacOS.

# Tools
Install these tools.
* homebrew
* iterm
* tmux
* nvim
* luajit
* tree-sitter
* fish

# Installation
Currently it's only possible to install these dotfiles manually.

## Linking files
Rather than moving files around it is a lot easier to link files using symlinks.

Here's an example of my `.tmux.conf` and how to link it on a new machine:
```mermaid
flowchart LR
A -> B
```

`ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf`

[![](https://mermaid.ink/img/pako:eNpNj7EKgzAQhl8l3NSCDu3oUKhG6FawbsYhmLMGTCIxoS3quzdWhN50_N93cP8EjREICTwtHzpSUqZJmGt141bUJI4vc4lvN5P0UBivxXHj6UpINlFs5CiNXrY4-x3cNc6EVgWOvnfkVP-z8mVmku_sXEMECq3iUoQfptVk4DpUyCAJq8CWB5EB00tQ_SC4w1xIZywkLe9HjIB7Zx4f3UDirMddopKHSmoLly9A_0pT)](https://mermaid-js.github.io/mermaid-live-editor/edit#pako:eNpNj7EKgzAQhl8l3NSCDu3oUKhG6FawbsYhmLMGTCIxoS3quzdWhN50_N93cP8EjREICTwtHzpSUqZJmGt141bUJI4vc4lvN5P0UBivxXHj6UpINlFs5CiNXrY4-x3cNc6EVgWOvnfkVP-z8mVmku_sXEMECq3iUoQfptVk4DpUyCAJq8CWB5EB00tQ_SC4w1xIZywkLe9HjIB7Zx4f3UDirMddopKHSmoLly9A_0pT)

# Todo
* Set up installation script
* Create better documentation
* Describe how I use lynx and pandoc to view md files in terminal

