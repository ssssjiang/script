#!/bin/zsh

export image_path=/persist/tmp/2021-08-19_18-59-13__
# ['pinhole-radtan', 'pinhole-equi', 'omni-radtan', 'pinhole-fov', 'ds-none', 'omni-none', 'eucm-
# none']
export camera_model=pinhole-equi
# 配置环境
source ./devel/setup.zsh 

# 由相机图像文件生成rosbag
# argv[1] = image_filepath , eg. ${image_path} 或 使用相对路径。
# argv[2] = rosbag_file, eg. ${image_path}/fisheye.bag 或 使用相对路径。
# 标定tag-fisheye 加 tag 标志
rosrun kalibr kalibr_apr2bag_system ${image_path} ${image_path}/fisheye.bag tag > ${image_path}/compute_bag.log

# 运行多靶标标定 
# --target target_multi.yaml ， eg. /home/songshu/Repos/kalibr_ws/datas/april_6x6_multi.yaml
# --bag rosbag_file, 上一个脚本输出的bag
# --models camera_models , eg. pinhole-equi
# --topics /cam0/image_raw , 生成rosbag时，images所在的topics
# --cam-extrinsics 标定相机外参
rosrun kalibr kalibr_calibrate_cameras --target datas/april_6x6_multi.yaml --bag ${image_path}/fisheye.bag --models ${camera_model} --topics /cam0/image_raw > ${image_path}/compute_calib.log

# 标定的结果输出在rosbag所在的文件夹下
