class AddImageIdToAnswerOpts < ActiveRecord::Migration[5.2]
  def change
    add_column :answer_opts, :image_id, :int
  end
end
