class AddQuestionRefToAnswerOpt < ActiveRecord::Migration[5.1]
  def change
    add_reference :answer_opts, :question, foreign_key: true
  end
end
