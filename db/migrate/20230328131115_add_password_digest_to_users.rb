class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_digest, :string, null: false
    change_column :users, :email, :string, unique: true, null: false
  end
end
