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
| first_name          | string     | null: false                    |
| last_name           | string     | null: false                    |
| first_name_kana     | string     | null: false                    |
| last_name_kana      | string     | null: false                    |
| birth_day           | date       | null: false                    |

- has_many : items
- has_many : orders
- belongs_to_active_hash :birth_day

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
| users                | references | null: false, foreign_key: true |

- belongs_to : user
- has_many : orders 
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_type
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :shipping_period


## ordersテーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| users                | references | null: false  foreign_key: true |
| items                | references | null: false  foreign_key: true |
| addresses            | references | null: false  foreign_key: true |
- belongs_to : user
- belongs_to : item
- has_one : addresses

## addressesテーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| post_code           | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| municipality        | text       | null: false                    |
| address_number      | text       | null: false                    |
| building            | text       | null: false                    |
| telephon_number     | string     | null: false                    |
| order               | references | null: false  foreign_key: true |
- has_one : orders
- belongs_to_active_hash :prefecture
