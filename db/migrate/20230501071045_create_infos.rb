class CreateInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :infos do |t|
      t.string :first_name
      t.string :last_name
      t.date :dob
      t.string :prefix
      t.string :phone_no
      t.integer :user_id

      t.timestamps
    end
    add_index :infos, :user_id
  end
end
