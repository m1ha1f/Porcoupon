class RenamePassword < ActiveRecord::Migration
  def up
  	rename_column :users, :password, :encrypted_password
  end

  def down
  	rename_column :users, :encrypted_password, :password
  end
end
