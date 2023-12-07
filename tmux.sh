#!/bin/bash

tmux new-session -d -s main irb
tmux neww -c /home/mike/proj/ -n "Trunk"
tmux neww -c /home/mike/bld/ -n "Build"
tmux neww -c /home/mike/bld/ # "mc"
tmux neww -c /home/mike/bld/ # 4 
tmux neww # 5
tmux neww # 6
tmux neww # 7
tmux neww # 8
# 9
tmux neww -c /home/mike/src 

tmux neww jupyter notebook

tmux attach-session -t main
