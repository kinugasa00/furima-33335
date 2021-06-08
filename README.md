# README

# テックキャンプ最終課題

### フリマアプリのクローンサイトを個人で作成。
### ユーザーの新規登録から商品の出品および購入が可能。
#### This web application that hosts a free-market is developed by personal.
#### Users can create their free-market accounts with this application, and sell or purchase products.

## 説明:Description
* ユーザー登録機能としてSNS及びSMS認証等を行い、クレジットカードを登録できます。
* 商品出品機能として画像や商品カテゴリを含めた複数項目の情報をDBへ登録することができます。
* 品購入機能としてユーザーが所持するクレジットカードを用いて商品の購入ができます。
* SNS, SMS authentication is used to create a user account. Also, within a user account, a credit card can be registered.
* SNS, SMS authentication is used to create a user account. Also, within a user account, a credit card can be registered.
* When users purchases a product, the credit card that is registered in their account can be used.

## 開発環境:Development environment

### リンク
https://furima-33335.herokuapp.com/

## Basic認証
* ID: admin
* Pass: 2222

## 購入者アカウント
* email
* pass
* card
* 利用期限
* セキュリティコード

## 出品者アカウント
* email
* pass

### Development environment
* Ruby 2.6.5
* Ruby on Rails 6.0.6
* mysql2
* AWS S3
* Rspec


## Database設計
### ERD:EntityRelashionshipDiagram
https://gyazo.com/e8aad85465ed2f152a7e167c4bc0507a


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
has_one :order  

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
belongs_to:order  


