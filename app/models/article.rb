class Article < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  validates :title, presence: true
  validates :avatar, presence: true

end
