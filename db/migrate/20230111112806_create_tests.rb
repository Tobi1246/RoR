class CreateTests < ActiveRecord::Migration[6.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false 
      t.integer :level, default: 1 , null: false
      t.references :category, null: false, foreign_key: true
      t.references :author_id, null: false, foreign_key: { to_table: :user}

      t.timestamps
    end
  end
end
