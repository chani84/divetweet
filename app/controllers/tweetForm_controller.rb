class TweetForm
  include ActiveModel::Model #テーブルは持ちませんがApplicationRecordのsaveメソッドなどを提供します

  attr_accessor :name, :content, :date, :dive_point, :temperature, :water_temperature, :water_opacity, :depth_average, :suit, :licence, images_attributes: [:image]

  validates :name, :content, presence: true

  def save
    return false if invalid? #バリデーションを追加する場合はここに追加します

    tweet = Tweet.new:name, :content, :date, :dive_point, :temperature, :water_temperature, :water_opacity, :depth_average, :suit, :licence)
    tweet.images.new(images_attributes: [:image]) #この処理をimageの分だけループすれば複数保存も出ます
    tweet.save
  end
end
