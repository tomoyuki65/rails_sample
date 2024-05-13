# Railsで最小構成のバックエンドAPIサンプル　　
Railsで最小構成からバックエンドAPIを開発するためのサンプルです。    
  
## 機能一覧  
・ユーザー作成（POST /api/v1/user）  
・ユーザー1件取得（GET /api/v1/user/{uid}）  
・ユーザー更新（PUT /api/v1/user/{uid}）  
・ユーザー論理削除（DELETE /api/v1/user/{uid}）  
・ユーザーを論理削除データ含めて全件取得（GET /api/v1/users/with-discarded） 
  
## 使用技術  
Ruby "3.3.1"  
Rails "7.1.3.2"  
Docker  
docker-compose  
MySQL "8.0.36"  
RSpec  
  
## 参考記事  
[・Rails7で最小構成からバックエンドAPIを開発する方法まとめ](https://tomoyuki65.com/how-to-develop-an-api-from-a-minimal-configuration-with-rails7)  
  