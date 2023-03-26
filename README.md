# DockerとViteを使用した環境構築

# 前提条件
 - Docker Desktopをインストールしていること

# 環境構築方法
```
./shell.sh [サービス名]

ex) ./shell.sh node

```

# 起動方法
```
cd vite-project
docker-compose up
```

# 停止方法
```
docker-compose down
```

# コンテナ、ボリューム、ネットワーク、イメージを削除する
```
docker-compose rm -v
```
