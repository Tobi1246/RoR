class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.text :title
      t.integer :test_id
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
