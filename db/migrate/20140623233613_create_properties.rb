class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string  :address
      t.string  :city
      t.string  :state
      t.integer :zip
      t.text    :legal_desc
      t.integer :user_id

      t.timestamps
    end
      add_index :properties, [:user_id, :updated_at]
  end
end
