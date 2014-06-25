class AddPasswordDigestToAnalysts < ActiveRecord::Migration
  def change
    add_column :analysts, :password_digest, :string
  end
end
