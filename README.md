# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| nickname           | string   | null: false |
| birthday           | datetime | null: false |
| familyname         | string   | null: false |
| firstname          | string   | null: false |
| familyname_kana    | string   | null: false |
| firstname_kana     | string   | null: false |


### Association

- has_many :items
- has_many :buys

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| image      | text       | null: false                    |
| concept    | text       | null: false                    |
| seller     | references | null: false, foreign_key: true |
|category    | string     | null: false                    |
|status      | string     | null: false                    |
|load        | string     | null: false                    |
|region      | string     | null: false                    |
|days        | datetime   | null: false                    | 
|price       | integer    | null: false                    | 


### Association

- has_one :buy
- belongs_to :user

## buys テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| buyer     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :delivery

## deliverys テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postcode       | string     | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | integer    | null: false                    |
|phonenumber     | integer    | null: false                    |


### Association

- belongs_to :buy
