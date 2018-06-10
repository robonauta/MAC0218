class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.text :link
      t.integer :nviews

      t.timestamps
    end
  end
end
