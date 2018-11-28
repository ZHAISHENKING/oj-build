if [ ! $1 ]; then
    echo 参数必需
    echo 请传入新镜像版本号（数字）
    exit
fi

if [ $1 -eq $(cat old.txt) ]; then
    echo 不能与上个版本号相同
    exit
fi

cd /home/ubuntu/ultrabear-online
git pull origin dev
echo "-------拉取成功------"
source /home/ubuntu/ienv/bin/activate
sleep 3
docker build -t="zskin/oj-backend:$1" .
echo "-------打包成功------"
echo VERSION=$1 > /home/ubuntu/ultrabear-oj/OnlineJudgeDeploy/.env

cd /home/ubuntu/oj-build/
if [ ! -s "new.txt" ]; then
    echo 空文件
    echo $1 > new.txt
else
    echo 文件非空
    cat new.txt > old.txt
    echo $1 > new.txt
fi

echo "-------开始部署------"
cd /home/ubuntu/ultrabear-oj/OnlineJudgeDeploy
docker-compose up -d
echo "-------部署成功------"

