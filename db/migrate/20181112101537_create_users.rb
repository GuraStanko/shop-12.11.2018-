class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.integer :age

      t.timestamps
    end
  end
end
