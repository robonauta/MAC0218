class ForeignKeyAdjustments < ActiveRecord::Migration[5.2]
  def change
    remove_reference :answer_opts, :project, foreign_key: true
    add_column :projects, :description, :text
    remove_column :projects, :cost, :float
    drop_table :posts
  end
end
