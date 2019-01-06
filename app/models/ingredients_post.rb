class IngredientsPost < ApplicationRecord
  belongs_to :post
  belongs_to :ingredient
  
end
