# アプリ名：saigai_info
![運用画面](app/assets/images/saigai__info_page.png)

## アプリ概要
災害発生後に自治体のライフライン支援情報や自治区の災害情報をマップ上で視覚的に把握するアプリです。  
地図上の任意の地点にアイコンを選んで登録できます。  
アイコンを登録した後は、アイコンに名称をつけコメントを加えることで最新の情報を共有できます。  
コメントにいいね機能をつけることで情報の信憑性を計ります。  
マップ作成者が情報を管理しますが、閲覧者も自由にアイコンを登録したり、コメントを書いたりできます。  
マップ作成者のみがアイコンの削除やコメントの編集・削除ができます。  

## バージョン
ruby version: ruby 2.6.5  
rails version: rails 5.2.4  

## 機能一覧
- マップ作成機能
   - マップを新規に作成する

- アイコン作成機能
   - マップ上の任意の地点にアイコンを登録する(アイコンはメニューから選ぶ）
   - 登録したアイコンに地点の名称をつける

- コメント閲覧・作成機能
   - 登録した地点（のアイコン）をクリックしてその地点へのコメントを閲覧する
   - 登録した地点（のアイコン）に対し新たにコメントを加える

- コメント評価機能
   - 登録した地点に対してなされた各コメントが役に立つか否かボタンを押し評価する(ボタンは「役に立つ」「役に立たない」の2つ)(セッションIDが同じ場合は一つのコメントに対して2回以上ボタンが押せない)

- 管理機能
   - マップ作成者が登録されたアイコンの削除、コメントの削除ができる。

## テーブル定義
![テープル定義](app/assets/images/table_definition.png)

## ER図
![ER図](app/assets/images/ER_diagram2.png)

## 画面遷移図
![画面遷移図](app/assets/images/screen_transition_diagram.png)

## 使用Gem
* 'webpacker'
* 'mapbox-gl-rails'
* 'sassc-rails'
* 'font-awesome-sass'
* 'gem 'jquery-rails'
* 'gem 'jquery-turbolinks'
*  etc.

## スタート
1. git clone
2. bundle install
3. npm install
4. rails db:create rails db:migrate
6. .env（MAPBOX_API_KEY)
7. rails s
8. bin/webpack-dev-server
