# README

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| birthday           | integer | null: false               |

### Association
  has_many :items
  has_many :orders


## items テーブル
| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| item            | string    | null: false                    |
| price           | integer   | null: false                    |
| user            | reference | null: false, foreign_key: true |
| category        | string    | null: false                    |
| situation       | text      | null: false                    |
| delivery_charge | string    | null: false                    |
| region          | string    | null: false                    |
| shipment        | string    | null: false                    |

### Association
  belongs_to :user
  has_one   :orders


## orders テーブル
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| address       | integer   | null: false |
| prefectures   | string    | null: false | 
| municipality  | string    | null: false |
| house_number  | string    | null: false |
| building_name | string    |             |
| tel           | integer   | null: false |
| user          | reference | foreign_key |
| item          | reference | foreign_key |


### Association
  belongs_to :users
  belongs_to :orders

