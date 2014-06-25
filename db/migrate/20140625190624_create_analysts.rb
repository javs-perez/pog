class CreateAnalysts < ActiveRecord::Migration
  def change
    create_table :analysts do |t|
      t.string :name
      t.string :email
      t.boolean :analyst

      t.timestamps
    end
  end
end
