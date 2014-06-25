class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string    :toi
      t.date      :date_signed
      t.date      :date_recorded
      t.string    :party1
      t.string    :party2
      t.string    :cfn
      t.string    :county
      t.integer   :amount
      t.integer   :property_id

      t.timestamps
    end
    add_index :documents, [:property_id, :cfn]
  end
end
