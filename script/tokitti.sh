#!/bin/sh
srcdir=pcd/
dstdir=uploads
prefix=FB_

#create basic_ai format for upload
mkdir basic_ai
mkdir basic_ai/lidar_point_cloud_0
mkdir basic_ai/camera_image_0
mkdir basic_ai/camera_config

# find all files in pcd dir , using pcd file as basic to find others
PCD_FILES=`find "pcd/" -maxdepth 1 -type f` #-printf "%f\n"
echo $PCD_FILES
counter=0
for i in $PCD_FILES
do
    echo "$i"
    sub_i=${i:4:11} #file name as key word
    echo "$sub_i"
    found=`find "image/" -maxdepth 1 -type f -name "$sub_i*"`
    found_num=`find "image/" -maxdepth 1 -type f -name "$sub_i*" | wc -l `
    echo $counter
    if [ $found_num -eq 0 ] && [[ "$counter" -lt 100 ]]; then
    #echo "no found"
    #echo "sub num" ${sub_i:0:10}
    found_num_second=`find "image/" -maxdepth 1 -type f -name "${sub_i:0:10}*" | wc -l `
    found_second=`find "image/" -maxdepth 1 -type f -name "${sub_i:0:10}*"`
    if [ $found_num_second -eq 0 ] && [[ "$counter" -lt 100 ]]; then
    echo "second also no found"
    fi
    for j in $found_second
    do
        echo "enter second found!!"
        cp $i basic_ai/lidar_point_cloud_0/$sub_i.pcd
        cp $j basic_ai/camera_image_0/$sub_i.png
        touch basic_ai/camera_config/$sub_i.json
        counter=$((counter+1))
        echo $j
        break
    done
    elif [ $found_num -ge 1 ] && [[ "$counter" -lt 100 ]]; then
    for k in $found
    do
        cp $i basic_ai/lidar_point_cloud_0/$sub_i.pcd
        cp $k basic_ai/camera_image_0/$sub_i.png
        touch basic_ai/camera_config/$sub_i.json
        counter=$((counter+1))
        echo $k
        echo "\n"
        break
    done
    elif [[ "$counter" -ge 100 ]]; then
    echo "over 100!!!"
    exit
    fi
    ##echo "$found_num"
    ##echo "$found_num_second"
done
