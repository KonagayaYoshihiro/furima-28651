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

|  Column          | Type   | Options     |
| ---------------- | ------ | ----------- |
|  nickname        | string | null: false |
|  email           | string | null: false |
|  password        | string | null: false |
|  last_name       | string | null: false |
|  first_name      | string | null: false |
|  last_name_kana  | string | null: false |
|  first_name_kana | string | null: false |
|  birthday        | data   | null: false |

### Association
- has_many :items
- has_many :purchases


## items テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| user         | references | null: false,foreign_key: true |
| name         | string     | null: false                   |
| description  | text       | null: false                   |
| images_id    | string     | null: false                   |
| category_id  | string     | null: false                   |
| status_id    | string     | null: false                   |
| delivery_id  | string     | null: false                   |
| purchases_id | string     | null: false                   |
| shipping_day | string     | null: false                   |
| price        | string     | null: false                   |

### Association
- belongs_to :users
- has_one :purchases
- has_one :images


## images テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | string     | null: false                    |

### Association
- belongs_to :items


## addresses テーブル

|  Column           | Type   | Options                       |
| ----------------- | ------ | ----------------------------- |
|  post_cord        | string | null: false                   |
|  prefectures_id   | string | null: false,foreign_key: true |
|  city             | string | null: false                   |
|  house_number     | string | null: false                   |
|  building_name    | string | null: false                   |
|  telephone_number | string | null: false                   |

### Association
- belongs_to :users


## purchasesテーブル

|  Column | Type       | Options                       |
| --------| ---------- | ----------------------------- |
|  user   | references | null: false,foreign_key: true |
|  item   | references | null: false,foreign_key: true |

### Association
- has_one :addresses
- belongs_to :users



## active_hashに該当するものはDBにデータを保存しないためREADMEへの記載はなし。