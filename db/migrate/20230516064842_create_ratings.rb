class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.integer :ride_id
      t.integer :rating_giver
      t.integer :rating_receiver
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
