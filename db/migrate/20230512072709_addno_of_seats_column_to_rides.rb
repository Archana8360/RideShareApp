class AddnoOfSeatsColumnToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :no_of_seats, :integer
  end
end
