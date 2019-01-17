class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.text            :image
      t.references      :tweet, foreign_key:true
      t.timestamps
    end
  end
end
