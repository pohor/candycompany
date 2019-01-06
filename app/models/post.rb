class Post < ApplicationRecord
  has_many :ingredients_posts
  has_many :ingredients, through: :ingredients_posts
end
