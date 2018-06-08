class CreateAnswerOpts < ActiveRecord::Migration[5.1]
  def change
    create_table :answer_opts do |t|
      t.text :text
      t.integer :nanswers

      t.timestamps
    end
  end
end
