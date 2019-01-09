class Comment < ApplicationRecord
  belongs_to :commented, polymorphic: true
  has_many :comments, as: :commented

end
