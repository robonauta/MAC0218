class AddImageReferenceToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :image, foreign_key: true
  end
end
