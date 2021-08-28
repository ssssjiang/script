#!/bin/bash
#SFTP配置信息
USER=songs
#待上传文件根目录
SRCDIR=/home/songshu/文档/code
#FTP目录
DESDIR=/home/songs/songs
#文件
FILE=image-matching-toolbox
#IP
IP=10.30.17.3
 
#获取文件
cd ${SRCDIR} ;

#发送文件 (关键部分）
sftp ${USER}@${IP} <<EOF
cd ${DESDIR}/
lcd ${SRCDIR}
put -r ${FILE}

EOF

