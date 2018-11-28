cd /home/ubuntu/oj-build
echo VERSION=`cat old.txt` > /home/ubuntu/ultrabear-oj/OnlineJudgeDeploy/.env
> new.txt
cd /home/ubuntu/ultrabear-oj/OnlineJudgeDeploy
docker-compose up -d
echo 回退成功
