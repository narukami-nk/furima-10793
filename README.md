# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| nickname            | string     | null: false                    |
| email               | string     | null: false, unique: true      |
| encrypted_password  | string     | null: false                    |
| nickname            | string     | null: false                    |
| first_name_kanji    | string     | null: false                    |
| last_name_kanji     | string     | null: false                    |
| first_name_kata     | string     | null: false                    |
| last_name_kata      | string     | null: false                    |
| birth_year          | integer    | null: false                    |
| birth_month         | integer    | null: false                    |
| birth_day           | integer    | null: false                    |

- has_many : items
- has_many : purchase
- belongs_to_active_hash :birth_year
- belongs_to_active_hash :birth_month
- belongs_to_active_hash :birth_day

## itemsテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false,                   |
| item_text           | text       | null: false                    |
| item_category       | integer    | null: false                    |
| item_status         | integer    | null: false                    |
| delivery_condition  | integer    | null: false                    |
| prefectures         | integer    | null: false                    |
| shipping_period_id  | integer    | null: false                    |
| item_price          | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |

- belongs_to : user
- has_many : purchase 
- belongs_to_active_hash :item_category
- belongs_to_active_hash :item_status
- belongs_to_active_hash :delivery_condition
- belongs_to_active_hash :prefectures
- belongs_to_active_hash :shipping_period


## purchaseテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| creditcard_number   | integer    | null: false                    |
| expiration_year     | integer    | null: false                    |
| expiration_day      | integer    | null: false                    |
| user                | references | null: false  foreign_key: true |
| item                | references | null: false  foreign_key: true |
| destination         | references | null: false  foreign_key: true |
- belongs_to : user
- belongs_to : item
- has_one : destination

## purchaseテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | integer    | null: false                    |
| prefectures         | integer    | null: false                    |
| municipality        | text       | null: false                    |
| address_number      | text       | null: false                    |
| building            | text       | null: false                    |
| telephon_number     | string     | null: false                    |
| item                | references | null: false  foreign_key: true |
- has_one : destination
- belongs_to_active_hash :prefectures
