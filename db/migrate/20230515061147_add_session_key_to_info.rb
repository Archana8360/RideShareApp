class AddSessionKeyToInfo < ActiveRecord::Migration[7.0]
  def change
    add_column :infos, :session_key, :string
  end
end
