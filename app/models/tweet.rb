class Tweet < ApplicationRecord
  has_many :comments
  has_many :images
end
