class CreatePassengers < ActiveRecord::Migration[7.0]
  def change
    create_table :passengers do |t|
      t.integer :ride_id
      t.integer :user_id

      t.timestamps
    end
  end
end
