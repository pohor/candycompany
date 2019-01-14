class Search < ApplicationRecord

  has_many :ingredients
  has_many :categories

  def search_posts

    posts = Post.all

    # posts = posts.where(["categories.any? |c| { c.name LIKE ?"}, category]) if category.present?
    # posts = posts.where(["ingredient LIKE ?", ingredient]) if ingredient.present?
    posts = posts.where(["time BETWEEN ? AND ?", time-15, time+15]) if time.present?
    posts = posts.where(["skills = ?", skills]) if skills.present?

    return posts
  end

end
