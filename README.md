# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users table
| nickname | string | null: false | 
| email    | string | null: false | 
| password | string | null: false | 

### Association

has_many :comments, dependent: :destroy
has_many :favorites, dependent: :destroy
has_many :todo_lists
has_many :user_reviews
has_many :seller_items, foreign_key: "seller_id", class_name: "items"
has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
has_one :points
has_one :profiles, dependent: :destroy
has_one :sending_destination, dependent: :destroy
has_one :credit_cards, dependent: :destroy

## profiles table
| Column           | Type       | Options                        | 
| ---------------- | ---------- | ------------------------------ | 
| first_name       | string     | null:false                     | 
| family_name      | string     | null:false                     | 
| first_name_kana  | string     | null:false                     | 
| family_name_kana | string     | null:false                     | 
| birth_day        | date       | null:false                     | 
| introduction     | text       |                                | 
| user             | references | null: false, foreign_key: true | 

### Association
belongs_to :user


## sending_destinations table
| Column                       | Type       | Options                        | 
| ---------------------------- | ---------- | ------------------------------ | 
| destination_first_name       | string     | null: false                    | 
| destination_family_name      | string     | null: false                    | 
| destination_first_name_kana  | string     | null: false                    | 
| destination_family_name_kana | string     | null: false                    | 
| post_code                    | intege     | null:false                     | 
| prefecture_code              | integer    | null:false                     | 
| city                         | string     | null:false                     | 
| house_number                 | string     | null:false                     | 
| building_name                | string     |                                | 
| phone_number                 | integer    | unique: true                   | 
| user                         | references | null: false, foreign_key: true | 
| fee                          | string     | null: false                    | 

### Association
belongs_to :user


## todo_lists table
| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ | 
| list   | text       | null:false                     | 
| user   | references | null: false, foreign_key: true | 

### Association
belongs_to :user

## points table
| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ | 
| point  | integer    |                                | 
| user   | references | null: false, foreign_key: true | 

### Association
belongs_to :user

## user_reviews table
| Column     | Type       | Options                        | 
| ---------- | ---------- | ------------------------------ | 
| review     | text       | null: false                    | 
| user       | references | null: false, foreign_key: true | 
| item       | references | null: false, foreign_key: true | 
| evaluation | references | null: false, foreign_key: true | 

### Association
belongs_to :user
belongs_to :item

## items table
| Column            | Type       | Options                        | 
| ----------------- | ---------- | ------------------------------ | 
| item_name         | string     | null: false                    | 
| ]introduction     | text       | null: false                    | 
| price             | integer    | null: false                    | 
| item_condition    | references | null: false,foreign_key: true  | 
| postage_payer     | references | null: false,foreign_key: true  | 
| prefecture_code   | integer    | null: false                    | 
| preparation_day   | references | null: false, foreign_key: true | 
| postage_type      | references | null: false, foreign_key: true | 
| image             | references | null: false, foreign_key: true | 
| category          | references | null: false, foreign_key: true | 
| trading_status    | string     | null: false                    | 
| shopping_deadline | timestamp  |                                | 
| images            | string     | null:false                     | 


### Association
has_many :comments, dependent: :destroy
has_one :user_reviews
belongs_to_active_hash :category
belongs_to_active_hash :item_condition
belongs_to_active_hash :postage_payer
belongs_to_active_hash :preparation_day
belongs_to_active_hash :postage_type
Gem：jp_prefecture


## Comments table
| Column     | Type       | Options                        | 
| ---------- | ---------- | ------------------------------ | 
| comment    | text       | null: false                    | 
| user       | references | null: false, foreign_key: true | 
| item       | references | null: false, foreign_key: true | 
| created_at | timestamp  | null: false                    | 

### Association
belongs_to :user
belongs_to :item


## Shopping_carts table
| Column              | Type       | Options                        | 
| --------------------| ---------- | ------------------------------ | 
| user                | references | null: false, foreign_key: true | 
| item                | references | null: false, foreign_key: true | 
| sending_destination | references | null: false  foreign_key: true | 

### Association
belongs_to :user
belongs_to :item
belongs_to :sending_destination
