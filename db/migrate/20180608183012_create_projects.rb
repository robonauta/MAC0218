class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.text :name
      t.float :cost

      t.timestamps
    end
  end
end
