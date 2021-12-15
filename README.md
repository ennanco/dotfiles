# Dotfiles with git bare repo
Recently I came across with a different approach to manage the dotfiles in linux. Previously, I have been managing this files using the *stow* tools and a bunch of symbolic links, however the use of a "bare" repository has turn to be much simple and easier tomanage the configuration og the machines.
I have describe this process in the following [Gist](https://gist.github.com/ennanco/d1c6a228f5aac23a3af6592135f0f8ae) which is in fact a resume of the process described [here.](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)

This repository contains the configuration files of my machine with all the optimizations and scripts that I mainly use on a daily basis. As my first research topic, my machine has become nearly a Deep Learning workstation therefore many enviroment variables are focused on setting up libraries such as CUDA or CuDNN.

Additionally, some scripts to specific actions has been implemented:

- *compiler*, to compile many languages and tex files
- *extract*, to decompress most common types
- *ide-tmux*, a personal preference to convert a terminal in a development framework with vim + tmux
- *K2_battery*, this script is used to retrieve the level of battery of my keuchron K2
- *screencasting*, this script has as main objetive to record the whole screen and the voice
- *webcam*, this script uses mpv in order to display it in the rigth-bottom corner of the screen. I mainly use this last two to record my classes

Some of the tools that are setup on a personal preference are:

* *vim*, with several Plugins setup with Plugged which is a more modern way than Vundle to deal with them.
* *nvim*, I am in a transition to this one because I hate that vim do not agree with the [XDG naming](https://wiki.archlinux.org/title/XDG_Base_Directory). In order to reduce the number of dotfiles in the home folder
* *tmux*, the main adaptation is the main key and the use of vim displacment keys to move arround the system
* *fonts*, some fonts that I particularly like and which I use in a daily basis such as **Comic Mono** and **Hack**, which has been patched to have ligadures and the powerline symbols
* *bash*, the three main files (.bash_profile,.bashrc and .profile) has been optimized and the use of powerline is included additionaly I have included some alias which are particular useful.

If you are interested in any of the bash scripts to record the webcam or screencasting, then head on the .scripts folder.
