#!/bin/bash
#export ALL_PROXY=socks5://127.0.0.1:1080
docker run -it --rm\
	-p 5901:5901 \
	--user 0 \
        -v /home/songshu:/persist \
	-v /media/songshu:/persist_disc \
	--cpuset-cpus="0-3" \
	algo_maplab:v1.2 zsh
