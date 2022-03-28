# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | -------- | ------------------------- |
| email              | string   | null: false ,unique: true |
| encrypted_password | string   | null: false               |
| nickname           | string   | null: false               |
| birthday           | date     | null: false               | 
| famil_yname        | string   | null: false               |
| first_name         | string   | null: false               |
| family_name_kana   | string   | null: false               |
| first_name_kana    | string   | null: false               |


### Association

- has_many :items
- has_many :buys

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| concept    | text       | null: false                    |
| users      | references | null: false, foreign_key: true |
|category_id | int        | null: false                    |
|status_id   | int        | null: false                    |
|load_id     | int        | null: false                    |
|region_id   | int        | null: false                    |
|days_id     | int        | null: false                    | 
|price       | integer    | null: false                    | 


### Association

- has_one :buy
- belongs_to :user

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| deliverys | references | null: false, foreign_key: true |
| shohin_id | int        | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery

## deliverys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | string     | null: false                    |
| prefectures_id | int        | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| phonenumber    | string     | null: false                    |
| building_name  | string     | null: false                    |


### Association

- belongs_to :buy
