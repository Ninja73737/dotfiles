# dotfiles
My cross-platform (MacOS and Linux) dotfiles

## Usage
If you want to make use of these yourself, just clone the repository with:
```bash
git clone https://github.com/Ninja73737/dotfiles/
```
...then copy everything to where it needs to go.

If you would like to also keep your dotfiles in github so that you have them backed up, create your own fork of the repository on GitHub, then clone the repository instead with:
```bash
git clone --bare https://github.com/{YOUR_USERNAME}/dotfiles/ .dotfiles
```
...then whenever you need to push a change, use git as you normally would, except replace the `git` part of your commands with `dotfiles` and it will use the fish alias in my configs so that it sets the working directory correct.
