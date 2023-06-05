class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.references :user, null: false, foreign_key: true
      t.text :title, null: false
      t.text :body, null: false
    end
  end
end
