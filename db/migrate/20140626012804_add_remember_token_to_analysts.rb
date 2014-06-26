class AddRememberTokenToAnalysts < ActiveRecord::Migration
  def change
  	add_column :analysts, :remember_token, :string
    add_index  :analysts, :remember_token
  end
end
