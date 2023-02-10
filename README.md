README

# 開発言語
- Ruby 3.0.1
- rails 6.1.6
# 就職Termの技術

- gem devise
- AWS EC2
# カリキュラム外の技術

- line-bot-api（Lineとの連携　間に合えば）
- gem chartkick（グラフ作成機能）
- gem ransack（検索　ソート機能）
- gem simple_calendar　カレンダー機能
- gem google-api-client　　youtubeAPI（導入予定）
# 実行手順

``` bash
$ git clone git@github.com:sakanann/My_Fridge.git
$ bundle install
$ yarn install
$ rails db:create && rails db:migrate
$ rails s
```
# カタログ設計

https://docs.google.com/spreadsheets/d/18LpKPnhx-foQ4BqH4yqpuFRci6Mf1vXBAwttlI7CaEA/edit#gid=2020033787

# テーブル定義書

https://docs.google.com/spreadsheets/d/18LpKPnhx-foQ4BqH4yqpuFRci6Mf1vXBAwttlI7CaEA/edit#gid=2020033787

# 画面遷移図
![-ウチの冷蔵庫-　トップページ(1)](https://user-images.githubusercontent.com/115099788/218136573-a918a1e5-a4c9-4d81-ba9f-19201ce1b9d5.png)

# ワイヤーフレーム

https://cacoo.com/diagrams/q5nv92jatoKV1sVN/97DDA

# ER図

![ER図 drawio](https://user-images.githubusercontent.com/115099788/218133428-63a5f3c4-80aa-4a6f-94a6-3b476cfe11ee.png)
