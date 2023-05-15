class AddForeignKeyToRides < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :rides, :users,column: :driver_id,on_delete: :cascade
    add_foreign_key :rides, :vehicles,column: :vehicle_id,on_delete: :cascade
  end
end
