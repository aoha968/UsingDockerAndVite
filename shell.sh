#!/bin/bash
# cloneしてきたGit情報はいらないので削除する
rm -rf .git
# 新しくGit管理を始める
git init

# 書き換えできるように権限をつける
chmod a+rw Dockerfile
chmod a+rw docker-compose.yml

# サービス名を引数で受け取る
sed -i '' 's/REPLACE/'"$1"'/g' docker-compose.yml

# Docker Image作成
docker-compose build

# Vite導入
docker-compose run $1 yarn create vite vite-project --template vue

# コメント行を削除する
sed -i -e 's/^#//' Dockerfile
sed -i -e 's/^#//' docker-compose.yml

# Project nameで指定したディレクトリに移動
cd vite-project

# node_modulesを入手
docker run --rm -v ${PWD}:/app -w /app node:18-alpine yarn install

# Project nameで指定したディレクトリに移動
mv ../docker-compose.yml ./docker-compose.yml
mv ../Dockerfile ./Dockerfile

# vite.config.jsを置き換える
rm ./vite.config.js
mv ../vite.config.js ./vite.config.js

# 不要なファイルを消す
rm ../docker-compose.yml-e
rm ../Dockerfile-e

# ビルド
docker-compose build --no-cache
