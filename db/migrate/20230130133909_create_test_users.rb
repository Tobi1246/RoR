class CreateTestUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :test_users do |t|

      t.timestamps
    end
  end
end
