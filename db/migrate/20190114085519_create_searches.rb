class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :ingredient
      t.string :category
      t.integer :time
      t.integer :skills

      t.timestamps
    end
  end
end
