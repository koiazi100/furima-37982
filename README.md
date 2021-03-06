# テーブル設計

## users テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | -----------------------------  |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| nickname           | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name         | string     | null: false                    |
| last_name_kana     | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| birthday           | date       | null: false                    |




### Association


- has_many :items
- has_many :purchase_records

## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| title         | string     | null: false                   |
| explanation   | text       | null: false                   |
| price         | integer    | null: false                   |
| user          | references | null: false, foreign_key: true|
| category_id   | integer    | null: false                   |
| status_id     | integer    | null: false                   |
| fee_burden_id | integer    | null: false                   |
| ship_day_id   | integer    | null: false                   |
| ship_area_id  | integer    | null: false                   |

### Association

- belong_to: user
- has_one  :purchase_record


## purchase_records テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| user                       | references | null: false, foreign_key: true |
| item                       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addresses テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| postcode                   | string     | null: false                    |
| prefecture_id              | integer    | null: false                    |
| city                       | string     | null: false                    |
| block                      | string     | null: false                    |
| building                   | string     |                                |
| phone_number               | string     | null: false                    |
| purchase_record            | references | null: false, foreign_key: true |


### Association


- belongs_to   :purchase_record

