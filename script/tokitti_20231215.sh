#!/bin/sh
srcdir=pcd/
dstdir=uploads
prefix=FB_

pwd=`pwd`
searchstring="rosbag2_"
rest=${pwd#*$searchstring}
echo ${#pwd}
echo $rest
echo ${#rest}
echo ${#searchstring}
echo $(( ${#pwd} - ${#rest} - ${#searchstring} ))

#create basic_ai format for upload
pcd_num=`find "pcd/" -maxdepth 1 -type f | wc -l `
folder_num=$((pcd_num /100))
folder_num=$((folder_num+1))
echo "folder num:"$folder_num


# find all files in pcd dir , using pcd file as basic to find others
PCD_FILES=`find "pcd/" -maxdepth 1 -type f` #-printf "%f\n"
echo $PCD_FILES
counter=0
folder_index=0
for i in $PCD_FILES
do
    echo "$i"
    sub_i=${i:4:11} #file name as key word
    echo "$sub_i"
    found=`find "image/" -maxdepth 1 -type f -name "$sub_i*"`
    found_num=`find "image/" -maxdepth 1 -type f -name "$sub_i*" | wc -l `
    echo $counter
    echo $found
    #echo $found_num

    # 檢查是否需要建立新的目標資料夾
    if [ $((counter % 100)) -eq 0 ]; then
        folder_index=$((folder_index + 1))
        target_folder="basic_ai_${rest}_part${folder_index}"
        mkdir -p "$target_folder"
        mkdir -p "$target_folder"/lidar_point_cloud_0
        mkdir -p "$target_folder"/camera_image_0
        mkdir -p "$target_folder"/camera_config
        
    fi
    

    if [ $found_num -eq 0 ]; then 
        #echo "no found"
        #echo "sub num" ${sub_i:0:10}
        found_num_second=`find "image/" -maxdepth 1 -type f -name "${sub_i:0:10}*" | wc -l `
        found_second=`find "image/" -maxdepth 1 -type f -name "${sub_i:0:10}*"`
        if [ $found_num_second -eq 0 ]; then
                echo "second also no found"
        fi
        for j in $found_second
        do
                echo "enter second found!!" 
                echo $i
                echo $j 
                cp $i basic_ai_"$rest"_part"$folder_index"/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part"$folder_index"/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part"$folder_index"/camera_config/$sub_i.json
                echo $j
                break
        done
    elif [ $found_num -ge 1 ]; then
        for k in $found
        do
                echo "enter first found!!"
                cp $i basic_ai_"$rest"_part"$folder_index"/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part"$folder_index"/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part"$folder_index"/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
        done
    fi

    counter=$((counter + 1))

done