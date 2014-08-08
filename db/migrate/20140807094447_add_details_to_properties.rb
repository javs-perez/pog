class AddDetailsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :folio, :string
    add_column :properties, :county, :string
  end
end
