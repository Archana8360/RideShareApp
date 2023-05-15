class AddActivateTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :activate_token, :string
  end
end
