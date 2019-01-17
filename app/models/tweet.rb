class Tweet < ApplicationRecord
  has_many :comments
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :user, optional: true
end
