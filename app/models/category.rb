class Category < ApplicationRecord
  validates :name, presence: true, length: 3..50

  has_many :categories_posts
  has_many :posts, through: :categories_posts
  mount_uploader :category_cover, CategoryCoverUploader
end
