class AddDeviseToAnalyst < ActiveRecord::Migration
	  def self.up
      ## Database authenticatable
      remove_column :analysts, :password_digest
      remove_column :analysts, :remember_token
      # remove_column :users, :single_access_token
      #t.string :email,              null: false, default: ""
      #t.string :encrypted_password, null: false, default: ""
      add_column :analysts, :encrypted_password, :string, null: false, default: ""
      ## Recoverable
      #t.string   :reset_password_token
      add_column :analysts, :reset_password_token, :string

      #t.datetime :reset_password_sent_at
      add_column :analysts, :reset_password_sent_at, :datetime
      ## Rememberable
      #t.datetime :remember_created_at
      add_column :analysts, :remember_created_at, :datetime

      ## Trackable
      #t.integer  :sign_in_count, default: 0, null: false
      add_column :analysts, :sign_in_count, :integer, default: 0, null: false
      #t.datetime :current_sign_in_at
      add_column :analysts, :current_sign_in_at, :datetime
      #t.datetime :last_sign_in_at
      add_column :analysts, :last_sign_in_at, :datetime
      #t.string   :current_sign_in_ip
      add_column :analysts, :current_sign_in_ip, :string
      #t.string   :last_sign_in_ip
      add_column :analysts, :last_sign_in_ip, :string
      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    

    # add_index :users, :email
    add_index :analysts, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
