class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.text :name, null: false
      t.text :img, null: false

      t.timestamps
    end
  end
end
