class Post < ApplicationRecord
  validates :title, presence: true, length: 3..50
  validates :content, presence: true, length: 3..2000
  validates :time, presence: true
  validates :skills, presence: true


  has_many :ingredients_posts
  has_many :ingredients, through: :ingredients_posts

  has_many :categories_posts
  has_many :categories, through: :categories_posts

  has_many :comments, dependent: :destroy

  belongs_to :user

  has_many :hearts
  has_many :users, through: :hearts

  mount_uploader :post_cover, PostCoverUploader

  def skills_name
    return 'łatwy' if skills == '1'
    return 'średni' if skills == '2'
    return 'trudny' if skills == '3'
  end

end
