## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|index: true, null: false, unique: true|
|mail|string|null: false|
|password|string|null: false|
|image|string|

### Association
has_many :tweets
has_many :comments

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|content|text|null: false|
|date|datetime|null: false|
|dive_point|string|null: false|
|water_temperature|string|null: false|
|temperature|integer|null: false|
|water_opacity|string|null: false|
|depth_average|string|null: false|
|suit|string|null: false|
|licence|string|null: false|

### Association
has_many :comments
has_many :images


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|foreign_key: true|
|tweet_id|references|foreign_key: true|

### Association
belongs_to :user
belong_to :tweet


## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|
|tweet_id|references|foreign_key: true|

### Association
belongs_to :tweet
