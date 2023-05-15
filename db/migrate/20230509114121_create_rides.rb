class CreateRides < ActiveRecord::Migration[7.0]
  def change
    create_table :rides do |t|
      t.string :source
      t.string :destination
      t.date :date
      t.time :time
      t.integer :driver_id
      t.string :about_ride
      t.integer :price
      t.integer :vehicle_id
      t.decimal :destination_lat
      t.decimal :destination_long
      t.decimal :source_lat
      t.decimal :source_long

      t.timestamps
    end
  end
end
