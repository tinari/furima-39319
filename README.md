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
| birthday           | date    | null: false               |

### Association
  has_many :items
  has_many :buys



## items テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | string     | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| content            | text       | null: false                    |
| category_id        | integer    | null: false                    |
| situation_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| region_id          | integer    | null: false                    |
| shipment_id        | integer    | null: false                    |

### Association
  belongs_to :user
  has_one    :buy


## orders テーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| address       | string     | null: false                    |
| region_id     | string     | null: false                    | 
| municipality  | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| tel           | string     | null: false                    |
| buy           | references | null: false, foreign_key: true |


### Association
  belongs_to :buy


## buys テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one    :order