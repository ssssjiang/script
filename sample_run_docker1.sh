#!/bin/bash
#export ALL_PROXY=socks5://127.0.0.1:1080
docker run -it --rm\
	-p 6901:6901 \
	--user 0 \
        -v /home/songshu:/persist \
	-v /media/songshu:/persist_disc \
	--cpuset-cpus="0-3" \
	kalibr:v1.1 bash
