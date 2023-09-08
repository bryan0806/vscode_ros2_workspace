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

startvalue=$1
stopvalue=$folder_num

for((i=1;i<=$stopvalue;i++)) do
    echo $i
    mkdir basic_ai_"$rest"_part"$i"
    mkdir basic_ai_"$rest"_part"$i"/lidar_point_cloud_0
    mkdir basic_ai_"$rest"_part"$i"/camera_image_0
    mkdir basic_ai_"$rest"_part"$i"/camera_config
done



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
    if [[ "$counter" -lt 100 ]]; then
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
                cp $i basic_ai_"$rest"_part1/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part1/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part1/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part1/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part1/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part1/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi

    elif [[ "$counter" -ge 100 ]] && [[ "$counter" -lt 200 ]]; then

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
                cp $i basic_ai_"$rest"_part2/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part2/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part2/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part2/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part2/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part2/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 200 ]] && [[ "$counter" -lt 300 ]];then

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
                cp $i basic_ai_"$rest"_part3/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part3/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part3/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part3/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part3/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part3/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 300 ]] && [[ "$counter" -lt 400 ]];then

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
                cp $i basic_ai_"$rest"_part4/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part4/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part4/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part4/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part4/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part4/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 400 ]]; then
        echo "over 400!!!"
        exit
    fi
    ##echo "$found_num"
    ##echo "$found_num_second"
done
