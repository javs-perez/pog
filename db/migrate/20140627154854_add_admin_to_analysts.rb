class AddAdminToAnalysts < ActiveRecord::Migration
  def change
    add_column :analysts, :admin, :boolean, default: true
  end
end
