#!/usr/bin/env sh

# Deploy lab
if ! sudo containerlab inspect -t hw1.clab.yaml >/dev/null 2>&1; then
    sudo containerlab deploy -t hw1.clab.yaml
fi
if [ $? -gt 0 ]; then
    exit 1
fi

tmux kill-pane -a
for i in $(seq 4); do
    tmux split-window -d "docker exec -it clab-hw1-pc${i} bash"
done
tmux select-layout tiled
