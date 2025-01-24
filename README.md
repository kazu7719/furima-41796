## users

|Column|Type|Options|
|---|---|---|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|encrypted_password|string|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|kana_last_name|string|null: false|
|kana_first_name|string|null: false|
|birthday|date|null: false|

### Association
has_many:items
has_many:orders



## items
|Column|Type|Options|
|---|---|---|
|product_name|string|null: false|
|discription|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|shipping_fee_id|integer|null: false|
|prefecture_id|integer|null: false|
|shipping_day_id|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
has_one:order
belongs_to:user



## orders
|Column|Type|Options|
|---|---|---|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|


### Association
belongs_to:user
belongs_to:item
has_one:address


## addresses
|Column|Type|Options|
|---|---|---|
|postal_code|string|null: false|
|prefecture_id|integer|null: false|
|municipalities|string|null: false|
|street_address|string|null: false|
|building_name|string||
|number|string|null: false|
|order|references|null: false|


### Association
belongs_to:order