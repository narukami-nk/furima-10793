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
| first_name          | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| birth_day           | date       | null: false                    |

- has_many : items
- has_many : orders

## itemsテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_text            | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| delivery_type_id     | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| shipping_period_id   | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

- belongs_to : user
- has_one  : order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_type
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_period


## ordersテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| user                 | references | null: false  foreign_key: true |
| item                 | references | null: false  foreign_key: true |
- belongs_to : user
- belongs_to : item
- has_one : address

## addressesテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | string     | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipality        | string     | null: false                    |
| address_number      | string     | null: false                    |
| building            | string     |                                |
| telephone_number    | string     | null: false                    |
| order               | references | null: false  foreign_key: true |
- belongs_to : order
- belongs_to_active_hash :prefecture
