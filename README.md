## users

|Column|Type|Options|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|name|string|null: false|
|birthday|string|null: false|

### Association
has_many:items
has_many:orders



## items

|Column|Type|Options|
|product_name|string|null: false|
|discription|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|shipping_fee_id|integer|null: false|
|shipping_from_id|integer|null: false|
|shipping_days_id|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|

### Association
has_one:order
belongs_to:user



## orders

|Column|Type|Options|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|


### Association
belongs_to:user
belongs_to:item
has_one:address


## addresses

|Column|Type|Options|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|municipalities|string|null: false|
|street_address|integer|null: false|
|building_name|string||
|number|integer|null: false|
|order|references|null: false|


### Association
belongs_to:order