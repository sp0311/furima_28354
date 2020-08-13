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












## items table
| Column            | Type       | Options                        | 
| ----------------- | ---------- | ------------------------------ | 
| name              | string     | null: false                    | 
| user              | references | null: false, foreign_key: true | 
| introduction      | text       | null: false                    | 
| price             | integer    | null: false                    | 
| category          | integer    | null: false,                   | 
| item_condition    | integer    | null: false,                   | 
| postage_payer     | integer    | null: false,                   | 
| preparation_day   | integer    | null: false,                   | 
| postage_type      | integer    | null: false,                   | 
| image             | string     | null: false,                   | 
| prefecture_code   | integer    | null: false                    | 

