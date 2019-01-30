class AddCoverToWorkshops < ActiveRecord::Migration[5.2]
  def change
    add_column :workshops, :workshop_cover, :string
  end
end
