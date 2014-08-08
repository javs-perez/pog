class AddDetailsToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :folio, :string
    add_column :properties, :country, :string
  end
end
