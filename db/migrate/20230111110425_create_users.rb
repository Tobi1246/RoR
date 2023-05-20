class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :firstname, null: false
      t.text :lastname
      t.text :email, null: false
      t.integer :age

      t.timestamps
    end
  end
end
