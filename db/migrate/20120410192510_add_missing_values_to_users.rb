class AddMissingValuesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password, :string

    add_column :users, :facebook_id, :integer

    add_column :users, :bayes, :binary

    add_column :users, :user_type, :integer

  end
end
