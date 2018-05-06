class RemoveNullFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :created_at, :datetime
    remove_column :users, :updated_at, :datetime
    add_column :users, :created_at, :datetime, :null => false
    add_column :users, :updated_at, :datetime, :null => false
  end
end
