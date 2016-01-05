class MoveUserPasswordField < ActiveRecord::Migration
  def change
    remove_column :users, :password_salt, :string
    remove_column :users, :password_hash, :string

    change_column :users, :nickname, :string, limit: 40

    add_column :user_identities, :password_salt, :string
    add_column :user_identities, :password_hash, :string
  end
end
