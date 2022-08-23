# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |  
| email              | string | null: false |   ＃ユニーク制約（migrationファイルに記載）
| encrypted_password | string | null: false |
| name               | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | text   | null: false |

### Association

-has_many :prototypes 
-has_many :comments

## prototypes テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |  
| title              | string     | null: false                    |
| catch_copy         | text       | null: false                    |
| user               | references | null: false, foreign_key: true |  #外部キー

### Association

-has_many  :comments
-belong_to :users

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |  
| content            | text       | null: false                    |
| prototype          | references | null: false, foreign_key: true |  #外部キー
| user               | references | null: false, foreign_key: true |  #外部キー

### Association

-belong_to :users
-belong_to :prototypes