# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| email              | string   | null: false ,unique: true |
| encrypted_password | string   | null: false               |
| nickname           | string   | null: false               |
| birthday           | date     | null: false               | 
| family_name        | string   | null: false               |
| first_name         | string   | null: false               |
| family_name_kana   | string   | null: false               |
| first_name_kana    | string   | null: false               |


### Association

- has_many :items
- has_many :buys

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| concept       | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
|category_id    | integer    | null: false                    |
|status_id      | integer    | null: false                    |
|load_id        | integer    | null: false                    |
|prefecture_id  | integer    | null: false                    |
|shipping_day_id| integer    | null: false                    | 
|price          | integer    | null: false                    | 


### Association

- has_one :buy
- belongs_to :user

## buys テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery

## deliveries テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | string     | null: false                    |
| prefecture_id  | intger     | null: false                    |
| municipality   | string     | null: false                    |
| address        | string     | null: false                    |
| phonenumber    | string     | null: false                    |
| building_name  | string     |                                |
| buy            | references | null: false, foreign_key: true |


### Association

- belongs_to :buy
