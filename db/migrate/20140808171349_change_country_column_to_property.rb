class ChangeCountryColumnToProperty < ActiveRecord::Migration
  def change
  	rename_column :properties, :county, :county
  end
end
