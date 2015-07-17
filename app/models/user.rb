class User < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments
  validates :username, presence: true, uniqueness: true, length: {in: 5..16}
  validates :password, presence: true, length: {in: 5..16}
end
