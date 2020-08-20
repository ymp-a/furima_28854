# テーブル設計

## users テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| last_name       | string   | null: false |
| first_name      | string   | null: false |
| kana_last_name  | string   | null: false |
| kana_first_name | string   | null: false |
| birthdate       | date     | null: false |
### Association

- has_many :items
- has_one :sold_items

## items テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| image      | text    | null: false |
| name       | string  | null: false | 
| descrption | text    | null: false |
| price      | integer | null: false |

### Association

- belongs_to :users
- has_one :sold_items

## sold_items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postalcode   | integer | null: false |
| address      | string  | null: false | 
| phone_number | integer | null: false |

### Association

- belongs_to :users
- belongs_to :items

