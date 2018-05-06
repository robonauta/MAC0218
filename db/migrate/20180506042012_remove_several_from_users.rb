class RemoveSeveralFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :nickname, :string
    remove_column :users, :password, :string
    remove_column :users, :name, :string
    remove_column :users, :age, :integer
    remove_column :users, :origin, :string
    remove_column :users, :type, :integer
    remove_column :users, :specie, :string
    remove_column :users, :habitat, :string
    add_column :users, :username, :string
    add_column :users, :email, :string
    add_column :users, :encrypted_password, :string
    add_column :users, :salt, :string
    add_column :users, :name, :string
    add_column :users, :organization, :string
  end
end
