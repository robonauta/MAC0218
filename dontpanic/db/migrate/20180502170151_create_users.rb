class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :password
      t.string :name
      t.integer :age
      t.string :origin
      t.integer :type
      t.string :specie
      t.string :habitat

      t.timestamps
    end
  end
end
