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
| items              | references | null: false, foreign_key: true |



### Association

- has_many :shipping_addresses
- has_many :items
- has_many :purchase_records

## items テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| title       | string     | null: false                   |
| explanation | text       | null: false                   |
| price       | string     | null: false                   |
| user        | references | null: false, foreign_key: true|

### Association

- belong_to: users
- has_one  :purchase_records
- belongs_to:shipping_addresses


## purchase_records テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| user                       | references | null: false, foreign_key: true |
| items                      | references | null: false, foreign_key: true |
| shipping_addresses         | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :items
- belongs_to :shipping_addresses


## shipping_addresses テーブル

| Column                     | Type       | Options                        |
| -------------------------- | ---------- | ------------------------------ |
| postcode                   | string     | null: false                    |
| city                       | string     | null: false                    |
| block                      | string     | null: false                    |
| building                   | string     |                                |
| phone_number               | string     | null: false                    |
| user                       | references | null: false, foreign_key: true |
| items                      | references | null: false, foreign_key: true |
| shipping_addresses         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :items
- has_many   :purchase_records

