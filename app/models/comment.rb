class Comment < ApplicationRecord
  validates :text, presence: true, length: 3..500

  include ActiveModel::Validations

  validates :text, presence: true, length: 6..500
  belongs_to :post
  belongs_to :user


end
