#!/bin/bash

tmux new-session -d -s main irb
tmux neww -c /home/mike/proj/nil -n "Trunk"
tmux neww -c /home/mike/
tmux neww -c /home/mike/
tmux neww -c /home/mike/
tmux neww # 5
tmux neww # 6
tmux neww # 7
tmux neww # 8
tmux neww -c /home/mike/proj/nil  -n "Trunk-2"

tmux neww jupyter notebook

tmux attach-session -t main
