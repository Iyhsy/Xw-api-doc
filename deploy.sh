#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run docs:build

# 进入生成的文件夹
cd docs/.vuepress/dist

# 初始化 git 仓库，并添加远程仓库地址
git init
git remote add origin https://github.com/Iyhsy/Xw-api-doc.git

# 创建一个新分支用于部署
git checkout -b dev

# 添加文件
git add -A

# 提交更改
git commit -m 'deploy'

# 推送到远程仓库的 gh-pages 分支
git push -f origin dev

# 回到上一级目录
cd -
