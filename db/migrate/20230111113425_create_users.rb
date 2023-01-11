class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :firstname
      t.text :lastname
      t.integer :age

      t.timestamps
    end
  end
end
