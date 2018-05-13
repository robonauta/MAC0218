class AddRankToUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :username, :string
    remove_column :users, :email, :string
    remove_column :users, :encrypted_password, :string
    remove_column :users, :salt, :string
    remove_column :users, :name, :string
    remove_column :users, :organization, :string
    remove_column :users, :created_at, :datetime
    remove_column :users, :updated_at, :datetime
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :encrypted_password, :string
    add_column :users, :salt, :string
    add_column :users, :name, :string
    add_column :users, :organization, :string
    add_column :users, :rank, :string
    add_column :users, :created_at, :datetime, :null => false
    add_column :users, :updated_at, :datetime, :null => false
  end
end
