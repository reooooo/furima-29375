# README

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false |
| encrypted_password   | string  | null: false |
| family_name          | string  | null: false | 
| last_mane            | string  | null: false |
| family_name_KANA     | string  | null: false |
| last_name_KANA       | string  | null: false |
| birthday             | date    | null: false |

### Association

has_many :products
has_one  :buy

## products テーブル

| Column   | Type       | Options                        |
| -------- | ---------  | ------------------------------ |
| name     | string     | null: false                    |
| explain  | text       | null: false                    |
| Category | integer    | null: false                    |
| status   | integer    | null: false                    |
| payment  | integer    | null: false                    |
| area     | integer    | null: false                    |
| date     | integer    | null: false                    |
| price    | integer    | null: false                    |
| image    | references | null: false, foreign_key: true |
| user     | references | null: false, foreign_key: true |

### Association

has_one    :buy
belongs_to :user

## addresses テーブル

| Column        | Type       | Option                        |
| ------------- | ---------- | ----------------------------- |
| postal_number | string     | null: false                   |
| prefecture    | integer    | null: false                   |
| city          | string     | null: false                   |
| house_number  | integer    | null: false                   |
| building_name | string     |                               |
| phone_number  | integer    | null: false                   |
| buy           | references | null:false, foreign_key: true |

### Association

has_one :buy

## buys テーブル

| Column  | Type       | Option                         |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association

belongs_to :user
belongs_to :product
belongs_to :address