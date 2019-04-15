class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :trip_name
      t.string :description
      t.integer :guide_comp_id

      t.timestamps
    end
  end
end
