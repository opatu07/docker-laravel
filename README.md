# dockerを使用したLaravel開発環境

# 初めに
これはdockerを使用した最小構成のLaravel開発環境になっています。
php,laravel,mysql,nginxが使えます。
各種設定で変えなければならない部分があるので各自の環境で設定を行なってください

# 各自の環境で変えてもらいたいこと
## phpのポート番号
docker-compose.ymlのservicesにあるphpのportsの番号が他のサービスと重複がないように設定してください。
## phpのバージョン
Dockerfileのphpのバージョンが環境で違うと思うので変更してください
## mysqlのポート番号
これもphpと同様にdocker-compose.ymlのservicesにあるので他のサービスと重複がないように設定してください
## mysqlのバージョン
ポート番号と同じように環境に合わせて変更してください
## mysqlのenviroment
laravelとmysqlを連携させる際にPASSWORDやDATABASEの部分を一致させなければなりません。
laravelプロジェクト内の.envと一致させてください
## laravelプロジェクトの環境変数
mysqlとlaravelプロジェクトを一致させるためにここにある環境変数を変更してください
## nginxのポート番号
これはphp,mysqlと同様に使われていないポート番号を指定できるようにしてください
## nginxの設定ファイルのrootの場所
nginxディレクトリのdefault.confファイルにあるrootの箇所をコンテナ内のlaravelのディレクトリ内のpublicパスと一致させなければなりません。

# dockerコマンドまとめ
## docker compose up -d
コンテナの作成
## docker compose ps -a
作成したコンテナのステータス確認
## docker run --rm -v ~開発しているsrcディレクトリのパス:/app composer create-project --prefer-dist laravel/laravel .
srcディレクトリにlaravelのインストールを行う。--rmオプションはコンテナ作成処理完了後自動削除される
## docker exec -it php php コンテナ内のlaravel内のartisanファイルのパス serve --host=0.0.0.0 --port=8000
laravelコンテナ内でサーバを立ち上げる
## docker compose down
コンテナの停止と削除
## docker compose exec -it php php コンテナ内のlaravel内のartisanファイルのパス migrate
laravelコンテナ内でphp artisan migrateコマンドの実行
