class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.string :name
      t.date :date_start
      t.date :date_end
      t.time :time_start
      t.time :end_time
      t.string :place
      t.text :description

      t.timestamps
    end
  end
end
