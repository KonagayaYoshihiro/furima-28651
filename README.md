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


# furimaテーブル設計

## users テーブル

|  Column             | Type   | Options     |
| ------------------- | ------ | ----------- |
|  nickname           | string | null: false |
|  email              | string | null: false |
|  password           | string | null: false |
|  last_name          | string | null: false |
|  first_name         | string | null: false |
|  last_name_kana     | string | null: false |
|  first_name_kana    | string | null: false |
|  birthday           | date   | null: false |
|  encrypted_password | string | null: false |

### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column         | Type       | Options                       |
| -------------- | ---------- | ----------------------------- |
| user           | references | null: false,foreign_key: true |
| name           | string     | null: false                   |
| description    | text       | null: false                   |
| category_id    | integer    | null: false                   |
| status_id      | integer    | null: false                   |
| delivery_id    | integer    | null: false                   |
| purchases_id   | integer    | null: false                   |
| shipping_day_id| integer    | null: false                   |
| price          | integer    | null: false                   |

### Association
- belongs_to :user
- has_one :purchase


## addresses テーブル

|  Column           | Type       | Options                       |
| ----------------- | ---------- | ----------------------------- |
|  post_cord        | string     | null: false                   |
|  prefectures_id   | integer    | null: false                   |
|  city             | string     | null: false                   |
|  house_number     | string     | null: false                   |
|  building_name    | string     |                               |
|  telephone_number | string     | null: false                   |
|  purchase         | references | null: false,foreign_key: true |

### Association
- belong_to :purchase


## purchasesテーブル

|  Column | Type       | Options                       |
| --------| ---------- | ----------------------------- |
|  user   | references | null: false,foreign_key: true |
|  item   | references | null: false,foreign_key: true |

### Association
- has_one :address
- belongs_to :user
- belongs_to :item


## active_hashに該当するものはDBにデータを保存しないためREADMEへの記載はなし。