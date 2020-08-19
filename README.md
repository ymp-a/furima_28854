# テーブル設計

## users テーブル

| Column    | Type     | Options     |
| --------- | -------- | ----------- |
| nickname  | string   | null: false |
| email     | string   | null: false |
| password  | string   | null: false |
| name      | string   | null: false |
| kananame  | string   | null: false |
| birthdate | datetime | null: false |
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

