class AddProjectRefToImages < ActiveRecord::Migration[5.1]
  def change
    add_reference :images, :project, foreign_key: true
  end
end
