class Heart < ApplicationRecord
  validates :user, uniqueness: { scope: :post, message: 'Already hearted' }
  belongs_to :post
  belongs_to :user
end
