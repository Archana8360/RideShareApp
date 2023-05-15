class AddNoOfSeatsToPassenger < ActiveRecord::Migration[7.0]
  def change
    add_column :passengers, :bookedseats, :integer
  end
end
