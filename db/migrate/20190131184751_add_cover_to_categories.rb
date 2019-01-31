class AddCoverToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :category_cover, :string
  end
end
