class User < ApplicationRecord
    
    has_one_attached :avatar
    has_secure_password
    has_many :articles, dependent: :destroy
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :name, presence: true
    validates :email, :uniqueness => true
    validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
  has_many :articles

end


