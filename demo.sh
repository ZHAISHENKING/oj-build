if [ ! $1 ]; then
    echo 必需带参数
    exit
fi

if [ $1 -eq $(cat old.txt) ]; then
    echo 不能与上个版本号相同
    exit
fi
