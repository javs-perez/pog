class ChangeCountryColumnToProperty < ActiveRecord::Migration
  def change
  	rename_column :properties, :country, :county
  end
end
