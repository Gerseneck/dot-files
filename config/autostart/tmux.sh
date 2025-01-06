#!/usr/bin/bash

tmux new-session -d -s "Workspace 4"
tmux send -t "Workspace 4".0 "mocp" C-m
tmux split-window -h -t "Workspace 4"
tmux select-pane -t "Workspace 4".1
tmux send -t "Workspace 4".1 "btop" C-m
tmux select-pane -t "Workspace 4".0

alacritty -e tmux attach-session -t "Workspace 4"
