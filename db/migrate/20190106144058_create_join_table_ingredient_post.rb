class CreateJoinTableIngredientPost < ActiveRecord::Migration[5.2]
  def change
    create_join_table :ingredients, :posts do |t|
      t.index [:ingredient_id, :post_id]
      t.index [:post_id, :ingredient_id]
    end
  end
end
