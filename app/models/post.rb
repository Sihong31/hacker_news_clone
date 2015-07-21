class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :body, presence: true

  # Can create a custom validation to check if either the url or body is present, so you don't have to always check for body.
end
