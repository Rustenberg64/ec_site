# カート機能を実装したECサイト

ログイン機能や管理者による商品の追加、変更、削除、ユーザーのカート機能など基本的な機能を実装したECサイトです。インフラはAWSを用いており、CD/CI Pipelineを作成してデプロイにかかる作業を簡略化しました。

URL: http://ecsit-publi-zrs2dzi235mb-1027193348.ap-northeast-1.elb.amazonaws.com

## 使用言語等

- Ruby on Rails 7.0.7
  - Ruby 3.2.2
- sqlite3
- Docker
- AWS
  - Copilot
  - ECS on Fargate
  - Codepipeline
- GitHub Actions

### 実装した機能

- deviseを用いたユーザーの作成、ログイン、ログアウト

- 商品一覧ページ
  
  - pagyを用いたページネーション
  - 商品の価格および日付によるソート機能
  - 画像のアスペクト比が異なる場合でも画像の大きさが整うようにした
  - 画像を読み込む際のN+1問題を解決

- カート機能
  
  - 個別の商品ページからカートに商品を追加可能
  - カートページでの商品の数量変更、削除、合計金額の計算

- 管理者ページでの商品の追加、削除、編集

- rspecを用いたテストとGitHub Actionを用いたCI pipeline

- AWS Codepipelineを用いたCD pipeline

## 実際のページ

- ### ホームページ
  
  左はカルーセルになっています
  
  ![大まかな図grpc](\\wsl.localhost\Ubuntu-22.04\home\yasuda\Docker_container\rails\myapp\READMEsrc\homepage.png)

- ### 商品一覧ページ
  
  画面上部の"Products"をクリックすることで遷移します
  
  右上の"Sort by"からソートの種類を選択できます
  
  一番下のページネーションのボタンを押すとページを移動できます
  
  商品の画像を選択することで商品の個別ページに移動します
  
  ![](\\wsl.localhost\Ubuntu-22.04\home\yasuda\Docker_container\rails\myapp\READMEsrc\products.png)

- ### 商品の個別ページ
  
  数量を選択して、"Add Cart"ボタンを押すことでカートに追加できます（ログインが必要）
  
  ![大まかな図grpc](\\wsl.localhost\Ubuntu-22.04\home\yasuda\Docker_container\rails\myapp\READMEsrc\product.png)

- ### カートページ
  
  ログイン後に右上の"Cart"から遷移できます
  
  カートの商品の数量変更および削除ができます
  
  ![](\\wsl.localhost\Ubuntu-22.04\home\yasuda\Docker_container\rails\myapp\READMEsrc\cart_items.png)

- ### 管理者ページ
  
  画面上部の"Admin"をクリックすることで遷移します（ログインが必要です）
  
  左上の"Add new product"から商品を追加できます（画像も含められる）
  
  個々の商品の右にある"Edit"から商品の編集と削除ができます
  
  ![](\\wsl.localhost\Ubuntu-22.04\home\yasuda\Docker_container\rails\myapp\READMEsrc\admin_products.png)
