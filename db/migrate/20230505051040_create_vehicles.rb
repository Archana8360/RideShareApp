class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :country
      t.string :vehicle_number
      t.string :vehicle_brand
      t.string :vehicle_name
      t.string :vehicle_type
      t.string :vehicle_color
      t.string :vehicle_model_year
      t.integer :user_id

      t.timestamps
    end
  end
end
