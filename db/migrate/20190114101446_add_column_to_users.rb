class AddColumnToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :nickname, :string, index: true, null: false, unique: true
    add_column :users, :image, :string
  end
end
