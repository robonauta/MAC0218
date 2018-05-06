class RemoveDateFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :created_at, :datetime
    remove_column :users, :updated_at, :datetime
    add_column :users, :created_at, :datetime
    add_column :users, :updated_at, :datetime
  end
end
