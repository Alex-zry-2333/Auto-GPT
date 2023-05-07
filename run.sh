#!/bin/bash
# 添加查询信息，用来确定脚本运行时使用版本是否和库安装版本一致。
python --version
pip -V
python scripts/check_requirements.py requirements.txt
if [ $? -eq 1 ]
then
    echo Installing missing packages...
    pip install -r requirements.txt
fi
python -m autogpt $@
read -p "Press any key to continue..."
