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

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postalcode    | string     | null: false                    |
| prefecture    | integer    | null: false                    | 
| city          | string     | null: false                    | 
| address       | string     | null: false                    | 
| building_name | string     | null: false                    | 
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |


## deals テーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true | 

