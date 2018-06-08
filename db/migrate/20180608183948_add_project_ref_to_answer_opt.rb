class AddProjectRefToAnswerOpt < ActiveRecord::Migration[5.1]
  def change
    add_reference :answer_opts, :project, foreign_key: true
  end
end
