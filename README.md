# README

## users テーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| name               | string  | null: false               |
| family_name        | string  | null: false               |
| kana_name          | string  | null: false               |
| kana_family_name   | string  | null: false               |
| date               | integer | null: false               |

### Association
  has_many :item
  has_many :order
  has_one  :buy


## items テーブル
| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| item               | string    | null: false                    |
| price              | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |
| content            | text      | null: false                    |
| category_id        | string    | null: false                    |
| situation_id       | string    | null: false                    |
| delivery_charge_id | string    | null: false                    |
| region_id          | string    | null: false                    |
| shipment_id        | string    | null: false                    |

### Association
  belongs_to :user
  has_one    :order
  has_one    :buy


## orders テーブル
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| address       | string    | null: false |
| region_id     | string    | null: false | 
| municipality  | string    | null: false |
| house_number  | string    | null: false |
| building_name | string    |             |
| tel           | string    | null: false |


### Association
  belongs_to :user
  belongs_to :item

## buys テーブル
| Column        | Type      | Options     |
| ------------- | --------- | ----------- |
| user_id       | reference |             |
| item_id       | reference |             |

belongs_to :user
belongs_to :item