class AddColumnToRides < ActiveRecord::Migration[7.0]
  def change
    add_column :rides, :selectedRouteData, :json, default: []
  end
end
