#!/bin/sh

cd /Users/mac/WebstormProjects/online/
git pull origin master && echo "拉取成功"
npm run build
sleep 5
cd /Users/mac/PycharmProjects/flask/ultrabear/judger/
rm -rf dist/
cp -R /Users/mac/WebstormProjects/online/dist ./
echo "拷贝成功"
echo "-----准备提交-----"
git add .
git commit -m $1
echo "git 提交注释：$1"
git push origin dev
echo "-----提交结束-----"
sleep 3
cd /Users/mac/WebstormProjects/online/
export TARGET=http://oj.ultrabear.com.cn
NODE_ENV=development npm run build:dll
npm run dev
