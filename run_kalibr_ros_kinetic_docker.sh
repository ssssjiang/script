#!/bin/bash

# 1. mount your source folder in host machine to /persist/src of
# the docker instance.
# 2. mount your clion and pycharm dir to /persist/prog/unix_dev_tools/clion
# and /persist/prog/unix_dev_tools/pycharm
# 3. --privileged option to use host GPU.
# 4. --security-opt seccomp=unconfined option to use GDB
# 5. --cpuset-cpus option should match your PC's core number. 
# 5. in TigerVNC, use address localhost:5901 annd password is 'vncpassword'

#--device /dev/nvidia0:/dev/nvidia0 \
#--device /dev/nvidiactl:/dev/nvidiactl \
#--device /dev/nvidia-uvm:/dev/nvidia-uvm \

sudo docker run -it --rm			        \
    -p 5901:5901 						\
    -p 2225:22 						\
    --user 0 						\
    --cpuset-cpus="0-7" 					\
    --privileged  						\
    --name kalibr_ros-kinetic  					\
    -v /home/songshu:/persist                                   \
    -v /media/songshu:/persist_disc                           \
    --cap-add=SYS_PTRACE --security-opt seccomp=unconfined  \
    kalibr:v1.4

