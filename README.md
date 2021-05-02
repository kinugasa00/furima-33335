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

Database

Users table
|Column|Type|Options|
|nickname|string|null: false|
|email|string|null: false,unique: true|
|password|string|null: false|
|encrypted_password|string|null: false|

Association
has_one :profile, dependent: :destroy
has_one :creditcard, dependent: :destroy
has_many :products, dependent: :destroy

Profiles table
|Column|Type|Options|
|user_id|references|foreign_key: true|
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|birth_day|integer|null: false|
|family_name|string|null: false|
|personal_name|string|null: false|
|family_name_kana|string|null: false|
|personal_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string||
|tel|integer||

Association
belongs_to :user

Credit card table
|Column|Type|Options|
|user_id|references|foreign_key: true|
|card_id|string|null: false|
|customer_id|string|null: false|

Association
belongs_to :user

product table
|Column|Type|Options|
|title|string|null: false|
|price|integer|null: false|
|deliver_cost|integer|null:false|
|user_id|foreign_key: true|
|category_id|references|foreign_key: true|
|text|text|null: false|
|items_status|string  null:false|
|from_area|string|null: false|
|leadtime|string|null: false|
|sell_status|string|null: false|
|brand_id|references|foreign_key: true|
|size_id|references|foreign_key: true|

Association
has_one :trade
has_many :product_images, dependent: :delete_all
belongs_to :user
belongs_to :brand
has_one :category
has_one :size

Image Table
|Column|Type|Options|
|image|string|null: false|
|product_id|references|foreign_key: true|

Association
belongs_to :product, optional:true, dependent: :destroy,

Size table
|Column|Type|Options|
|name|string|null: false|

Association
belongs_to :product

Brand table
|Column|Type|Options|
|brand_name|string||

Association
belongs_to :product

Categories table
|Column|Type|Options|
|category_name|string||

Association
belongs_to :product

Trade table
|product_id|references|foreign_key: true|
|buyer_id|references|foreign_key: { to_table: :users }, null: false|
|seller_id|references|foreign_key: { to_table: :users }, null: false|

Association
belongs_to :buyer, class_name: "User", foreign_key: "buyer_id"
belongs_to :seller, class_name: "User", foreign_key: "seller_id"
belongs_to :product