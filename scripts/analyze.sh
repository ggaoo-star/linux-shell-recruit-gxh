#!/usr/bin/env bash告诉系统用bash这个程序运行

# Task 07: complete this script.
# Usage: ./scripts/analyze.sh FILE
# 1. 检查是否有参数传入 $#代表传入参数个数  -ne不等于 echo"usage..:输出到屏幕 exit 1:退出脚本,返回状态码1(约定0为成功)
if [ $# -ne 1 ]; then
    echo "Usage: ./scripts/analyze.sh FILE"
    exit 1
fi

# 2. 检查文件是否存在
if [ ! -f "$1" ]; then
    echo "Error: File not found: $1"
    exit 1
fi

# 3. 统计 ERROR 行数 $(...)命令替换,执行命令再将命令的输出结果赋给变量   
error_count=$(grep -c "ERROR" "$1")

# 4. 找出出现次数最多的错误码
top_code=$(grep "ERROR" "$1" | grep -o 'code=[0-9]*' | cut -d'=' -f2 | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

# 5. 按指定格式输出
echo "Total ERROR: $error_count"
echo "Top Code: $top_code"