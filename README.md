# README

## users テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| nickname   | string  | null: false |
| email      | string  | null: false |
| password   | string  | null: false |
| name       | string  | null: false | 
| name(KANA) | string  | null: false |
| birthday   | integer | null: false |

### Association

has_many :products
has_one  :buy

## products テーブル

| Column   | Type       | Options                        |
| -------- | ---------  | ------------------------------ |
| name     | string     | null: false                    |
| explain  | text       | null: false                    |
| Category | string     | null: false                    |
| status   | string     | null: false                    |
| payment  | string     | null: false                    |
| area     | string     | null: false                    |
| date     | integer    | null: false                    |
| price    | integer    | null: false                    |
| image    | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

has_one    :addresses
has_one    :buys
belongs_to :users

## addresses テーブル

| Column        | Type    | Option      |
| ------------- | ------- | ----------- |
| postal_number | integer | null: false |
| prefecture    | string  | null: false |
| city          | string  | null: false |
| house_number  | integer | null: false |
| building_name | string  |             |
| phone_number  | integer | null: false |

### Association

belongs_to :products

## buys テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

belongs_to :users
belongs_to :products