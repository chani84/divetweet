class AddImagesToTweets < ActiveRecord::Migration[5.1]

  def change
    remove_column :tweets, :images, :string
  end
end
