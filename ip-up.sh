#此内容编辑保存成文件，并赋予777权限（chmod 777 xx)
#!/bin/bash
#获取IP，并将在线的IP写入up.txt的文件中
> /root/up.txt
for i in `seq 255`
do      {
        M_ip=192.168.100.$i
        ping -c1 -W1 $M_ip &>/dev/null
        if [ $? -eq 0 ]
        then
                echo "$M_ip" >> /root/up.txt
        fi
        }&
done
wait
echo "获取完成"
