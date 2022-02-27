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
graph LR
a -> b
```
`ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# Todo
* Set up installation script
* Create better documentation
* Describe how I use lynx and pandoc to view md files in terminal

