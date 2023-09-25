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
    elif [[ "$counter" -ge 400 ]] && [[ "$counter" -lt 500 ]];then

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
                cp $i basic_ai_"$rest"_part5/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part5/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part5/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part5/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part5/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part5/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 500 ]] && [[ "$counter" -lt 600 ]];then

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
                cp $i basic_ai_"$rest"_part6/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part6/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part6/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part6/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part6/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part6/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 600 ]] && [[ "$counter" -lt 700 ]];then

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
                cp $i basic_ai_"$rest"_part7/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part7/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part7/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part7/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part7/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part7/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 700 ]] && [[ "$counter" -lt 800 ]];then

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
                cp $i basic_ai_"$rest"_part8/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part8/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part8/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part8/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part8/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part8/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 800 ]] && [[ "$counter" -lt 900 ]];then

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
                cp $i basic_ai_"$rest"_part9/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part9/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part9/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part9/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part9/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part9/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 900 ]] && [[ "$counter" -lt 1000 ]];then

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
                cp $i basic_ai_"$rest"_part10/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part10/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part10/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part10/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part10/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part10/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 1000 ]] && [[ "$counter" -lt 1100 ]];then

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
                cp $i basic_ai_"$rest"_part11/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part11/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part11/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part11/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part11/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part11/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 1100 ]] && [[ "$counter" -lt 1200 ]];then

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
                cp $i basic_ai_"$rest"_part12/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part12/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part12/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part12/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part12/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part12/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 1200 ]] && [[ "$counter" -lt 1300 ]];then

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
                cp $i basic_ai_"$rest"_part13/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part13/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part13/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part13/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part13/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part13/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 1300 ]] && [[ "$counter" -lt 1400 ]];then

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
                cp $i basic_ai_"$rest"_part14/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part14/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part14/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part14/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part14/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part14/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 1400 ]] && [[ "$counter" -lt 1500 ]];then

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
                cp $i basic_ai_"$rest"_part15/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part15/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part15/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part15/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part15/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part15/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 1500 ]] && [[ "$counter" -lt 1600 ]];then

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
                cp $i basic_ai_"$rest"_part16/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part16/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part16/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part16/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part16/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part16/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 1600 ]] && [[ "$counter" -lt 1700 ]];then

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
                cp $i basic_ai_"$rest"_part17/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part17/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part17/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part17/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part17/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part17/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 1700 ]] && [[ "$counter" -lt 1800 ]];then

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
                cp $i basic_ai_"$rest"_part18/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part18/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part18/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part18/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part18/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part18/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 1800 ]] && [[ "$counter" -lt 1900 ]];then

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
                cp $i basic_ai_"$rest"_part19/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part19/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part19/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part19/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part19/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part19/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 1900 ]] && [[ "$counter" -lt 2000 ]];then

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
                cp $i basic_ai_"$rest"_part20/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part20/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part20/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part20/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part20/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part20/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 2000 ]] && [[ "$counter" -lt 2100 ]];then

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
                cp $i basic_ai_"$rest"_part21/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part21/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part21/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part21/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part21/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part21/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 2100 ]] && [[ "$counter" -lt 2200 ]];then

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
                cp $i basic_ai_"$rest"_part22/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part22/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part22/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part22/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part22/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part22/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 2200 ]] && [[ "$counter" -lt 2300 ]];then

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
                cp $i basic_ai_"$rest"_part23/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part23/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part23/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part23/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part23/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part23/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 2300 ]] && [[ "$counter" -lt 2400 ]];then

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
                cp $i basic_ai_"$rest"_part24/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part24/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part24/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part24/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part24/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part24/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 2400 ]] && [[ "$counter" -lt 2500 ]];then

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
                cp $i basic_ai_"$rest"_part25/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part25/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part25/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part25/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part25/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part25/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 2500 ]] && [[ "$counter" -lt 2600 ]];then

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
                cp $i basic_ai_"$rest"_part26/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part26/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part26/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part26/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part26/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part26/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 2600 ]] && [[ "$counter" -lt 2700 ]];then

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
                cp $i basic_ai_"$rest"_part27/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part27/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part27/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part27/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part27/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part27/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 2700 ]] && [[ "$counter" -lt 2800 ]];then

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
                cp $i basic_ai_"$rest"_part28/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part28/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part28/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part28/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part28/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part28/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 2800 ]] && [[ "$counter" -lt 2900 ]];then

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
                cp $i basic_ai_"$rest"_part29/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part29/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part29/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part29/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part29/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part29/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 2900 ]] && [[ "$counter" -lt 3000 ]];then

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
                cp $i basic_ai_"$rest"_part30/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part30/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part30/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part30/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part30/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part30/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 3000 ]] && [[ "$counter" -lt 3100 ]];then

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
                cp $i basic_ai_"$rest"_part31/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part31/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part31/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part31/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part31/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part31/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 3100 ]] && [[ "$counter" -lt 3200 ]];then

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
                cp $i basic_ai_"$rest"_part32/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part32/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part32/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part32/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part32/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part32/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 3200 ]] && [[ "$counter" -lt 3300 ]];then

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
                cp $i basic_ai_"$rest"_part33/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part33/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part33/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part33/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part33/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part33/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 3300 ]] && [[ "$counter" -lt 3400 ]];then

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
                cp $i basic_ai_"$rest"_part34/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part34/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part34/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part34/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part34/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part34/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 3400 ]] && [[ "$counter" -lt 3500 ]];then

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
                cp $i basic_ai_"$rest"_part35/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part35/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part35/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part35/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part35/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part35/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 3500 ]] && [[ "$counter" -lt 3600 ]];then

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
                cp $i basic_ai_"$rest"_part36/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part36/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part36/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part36/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part36/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part36/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 3600 ]] && [[ "$counter" -lt 3700 ]];then

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
                cp $i basic_ai_"$rest"_part37/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part37/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part37/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part37/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part37/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part37/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 3700 ]] && [[ "$counter" -lt 3800 ]];then

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
                cp $i basic_ai_"$rest"_part38/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part38/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part38/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part38/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part38/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part38/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 3800 ]] && [[ "$counter" -lt 3900 ]];then

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
                cp $i basic_ai_"$rest"_part39/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part39/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part39/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part39/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part39/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part39/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 3900 ]] && [[ "$counter" -lt 4000 ]];then

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
                cp $i basic_ai_"$rest"_part40/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part40/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part40/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part40/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part40/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part40/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 4000 ]] && [[ "$counter" -lt 4100 ]];then

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
                cp $i basic_ai_"$rest"_part41/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part41/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part41/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part41/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part41/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part41/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 4100 ]] && [[ "$counter" -lt 4200 ]];then

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
                cp $i basic_ai_"$rest"_part42/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part42/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part42/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part42/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part42/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part42/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 4200 ]] && [[ "$counter" -lt 4300 ]];then

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
                cp $i basic_ai_"$rest"_part43/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part43/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part43/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part43/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part43/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part43/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 4300 ]] && [[ "$counter" -lt 4400 ]];then

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
                cp $i basic_ai_"$rest"_part44/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part44/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part44/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part44/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part44/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part44/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 4400 ]] && [[ "$counter" -lt 4500 ]];then

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
                cp $i basic_ai_"$rest"_part45/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part45/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part45/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part45/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part45/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part45/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 4500 ]] && [[ "$counter" -lt 4600 ]];then

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
                cp $i basic_ai_"$rest"_part46/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part46/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part46/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part46/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part46/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part46/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 4600 ]] && [[ "$counter" -lt 4700 ]];then

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
                cp $i basic_ai_"$rest"_part47/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part47/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part47/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part47/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part47/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part47/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 4700 ]] && [[ "$counter" -lt 4800 ]];then

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
                cp $i basic_ai_"$rest"_part48/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part48/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part48/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part48/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part48/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part48/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 4800 ]] && [[ "$counter" -lt 4900 ]];then

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
                cp $i basic_ai_"$rest"_part49/lidar_point_cloud_0/$sub_i.pcd
                cp $j basic_ai_"$rest"_part49/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part49/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $j
                break
            done
        elif [ $found_num -ge 1 ]; then
            for k in $found
            do
                cp $i basic_ai_"$rest"_part49/lidar_point_cloud_0/$sub_i.pcd
                cp $k basic_ai_"$rest"_part49/camera_image_0/$sub_i.png
                touch basic_ai_"$rest"_part49/camera_config/$sub_i.json
                counter=$((counter+1))
                echo $k
                echo "\n"
                break
            done
        fi
    elif [[ "$counter" -ge 4900 ]]; then
        echo "over 4900!!!"
        exit
    fi
    ##echo "$found_num"
    ##echo "$found_num_second"
done
