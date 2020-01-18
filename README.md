# DOCKERでlaravel環境をPHP7.4で作る

## 1. Dockerインストール

## 2. クローン

`git clone [プロジェクト]`

## 3. mkcertインストール（ローカルでSSLするため不要ならしなくてもいい）

`mkcert -install`　ローカルCA(認証局)の構築

↓localhostなど
`mkcert xxxxxxxxx`　証明書の作成
コマンドで出力したファイルをcertに配置する。

## 4. ディレクトリ構成とファイル
```bash
docker
   ├── cert
   ├── db
   │   ├── Dockerfile
   │   ├── log
   │   ├── my.cnf
   │   └── mysql_data
   ├── docker-compose.yml
   └── php-apache
       ├── 000-default.conf
       ├── Dockerfile
       ├── default-ssl.conf
       └── php.ini
```

## 4. Docker起動

### 1. docker設定ファイルの作成

```
cd docker/  
cp .env.example .env
```

### 2. ビルドと起動

`docker-compose up -d --build`

### 3. sshでworkコンテナに接続

`docker-compose exec work bash`


## プロジェクト設定

以下workコンテナ内で実施

### 1. Laravel設定ファイル

`cp .env.example .env`

```
DB_HOST=mysql
DB_DATABASE=docker
DB_USSERNAME=root
DB_PASSWORD=root

```

### 2. 必要パッケージインストール

```
composer install
npm install
```

### 3. マイグレーション

```
php artisan migrate
```

### 4. hosts設定(任意)

```
127.0.0.1 xxxxxxxxx  
127.0.0.1 xxxxxxxxx
```

### 5. オートロードと表示

```
composer dump-autoload
```
### 6. 環境ができたかURLで確認してみる
https://xxxxxxxxx


## その他

* 次回からの起動(ビルド不要)
`docker-compose up -d`

* 起動確認
`docker-compose ps`

* ログ
`docker-compose logs --f`


## 参考
[docker環境設定][1]
[mkcert関連 Windows][2]
[mkcert関連 Mac][3]
[1]:https://qiita.com/Dok1211/items/1041e857862eb18e69df#4gitからlaravelのプロジェクトをcloneする
[2]:https://hepokon365.hatenablog.com/entry/2019/01/08/232455
[3]:https://qiita.com/Diwamoto/items/b9e6d61fb19a16eec871


## キャッシュクリア関連
```
php artisan clear-compiled  
php artisan view:clear  
php artisan cache:clear  
php artisan config:cache  
```
