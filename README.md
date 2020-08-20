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
- has_one :sold_item

## items テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| name       | string     | null: false                    | 
| descrption | text       | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :sold_item
- has_one_attached :image

## sold_items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postalcode   | integer | null: false |
| address      | string  | null: false | 
| phone_number | integer | null: false |

## deals テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true | 

