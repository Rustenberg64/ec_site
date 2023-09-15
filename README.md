## カート機能を実装したECサイト
URL: http://ecsit-publi-zrs2dzi235mb-1027193348.ap-northeast-1.elb.amazonaws.com

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

- rspecとcapybaraを用いたテスト
- GitHub Actionを用いたCI


### こだわった点
 1つ目は異なるアスペクト比の画像をどうやって整えるかという点。
ホームのページのカルーセルや商品一覧ページ、カートのページで商品の画像を扱っているが、
アスペクト比が異なっているためレイアウトが崩れてしまっていた。
そこで、CSSのobject-fit:containとBootstrapのRatiosを用いて
画像が統一的な大きさになるように工夫した。
2つ目は画像読み込みの際に生じるN+1問題を解決した点。
画像はデータベースに保存されているわけではないため、単純に
データベースからテーブルを取り出すと、そのテーブルの各行に対応する画像を1つ1つ
探してしまう。それによりN+1回のクエリが生じる。
そこでデータベースからテーブルを取り出す際、画像に関する情報をまとめて取得するようにして
クエリの回数を減らした。


