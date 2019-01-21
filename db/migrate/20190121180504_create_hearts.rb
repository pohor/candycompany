class CreateHearts < ActiveRecord::Migration[5.2]
  def change
      create_table :hearts do |t|
        t.references :post, foreign_key: true, null: false
        t.references :user, foreign_key: true, null: false
        t.timestamps
        t.index [:user_id, :post_id], unique: true
    end
  end
end
