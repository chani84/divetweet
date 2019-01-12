class CreateTweets < ActiveRecord::Migration[5.1]
  def change
    create_table :tweets do |t|
      t.string         :name, null: false
      t.text           :content, null: false
      t.datetime       :date, null: false
      t.string         :dive_point, null: false
      t.string         :water_temperature, null: false
      t.integer        :temperature
      t.string         :water_opacity
      t.string         :depth_average
      t.string         :suit
      t.string         :licence, null: false
      t.timestamps
    end
  end
end
