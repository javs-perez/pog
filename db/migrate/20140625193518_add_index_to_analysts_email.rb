class AddIndexToAnalystsEmail < ActiveRecord::Migration
  def change
 		add_index :analysts, :email, unique: true
  end
end
