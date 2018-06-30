class AddOptIdToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :opt_id, :int
  end
end
