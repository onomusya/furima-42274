# README

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :orders



## items テーブル

| Column                 | Type       | Options     |
| ---------------------- | ------     | ----------- |
| title                  | string     | null: false, limit: 40|
| content                | text       | null: false, limit: 1000|
| category_id            | integer    | null: false |
| condition_id           | integer    | null: false |
| shipping_fee_burden_id | integer    | null: false |
| prefecture_id          | integer    | null: false |
| shipping_day_id        | integer    | null: false |
| price                  | integer    | null: false, (300〜9,999,999)|
| user                   | references | null: false, foreign_key: true |

※imageはActiveStorageで実装するため含まない

### Association
- belongs_to :user
- has_one :order



## orders テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_address



## shipping_addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| order         | references | null: false, foreign_key: true |
| postal_code   | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address       | string     | null: false |
| building      | string     | 任意項目 |
| phone_number  | string     | null: false |

### Association
- belongs_to :order