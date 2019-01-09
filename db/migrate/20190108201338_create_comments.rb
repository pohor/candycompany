class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :commented_id
      t.string :commented_type

      t.timestamps
    end
  end
end
