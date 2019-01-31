class Ingredient < ApplicationRecord
  validates :name, presence: true, length: 3..50
  
  has_many :ingredients_posts
  has_many :posts, through: :ingredients_posts

end
