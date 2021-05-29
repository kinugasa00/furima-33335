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

# Database

## Users table
|Column|Type|Options|
|------|-----|-----|
|nickname    |string      |null: false|
|email|string|null: false,unique: true|
|encrypted_password|string|null: false|
|last_name   |string      |null: false|
|first_name  |string      |null: false|
|last_name_kana|string    |null: false|
|first_name_kana|string   |null: false|
|birthday     |date       |null:false|  

*Association*  
has_many:items  
has_many :orders  

## items table
|Column|Type|Options|
|------|-----|-----|
|title                   |string    |null: false|
|text                    |text      |null: false|
|category_id             |integer   |null: false
|sales_status_id         |integer   |null: false|
|shipping_fee_status_id  |integer   |null: false|
|prefecture_id           |integer   |null: false|
|scheduled_delivery_id   |integer   |null: false|
|price                   |integer   |null: false|
|user                    |references|null: false, foreign_key: true|  

*Association*  
belongs_to :user  
has_one :orders  

## orders table
|Column|Type|Options|
|------|-----|-----|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|  

*Association*  
belongs_to :user  
belongs_to :item  
has_one :address  

## address table
|Column|Type|Options|
|------|-----|-----|
|postal_code|string   |null: false|
|prefecture_id|integer|null: false|
|city_name|string     |null: false|
|block_name|string    |null: false|
|building_name        |string|
|phone_number|string  |null: false|
|order|references     |null: false, foreign_key: true|  

*Association*  
belongs_to:orders  

