class Podcast < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  belongs_to :category
  has_many :reviews
end
