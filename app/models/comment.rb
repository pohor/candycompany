class Comment < ApplicationRecord
  include ActiveModel::Validations

  validates :text, presence: true, length: 6..500
  belongs_to :post
  belongs_to :user


end
