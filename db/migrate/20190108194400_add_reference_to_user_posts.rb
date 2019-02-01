class AddReferenceToUserPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :posts, :user
    add_foreign_key :posts, :users
  end
end
