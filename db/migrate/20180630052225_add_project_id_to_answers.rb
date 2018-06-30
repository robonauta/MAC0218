class AddProjectIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :project_id, :int
  end
end
