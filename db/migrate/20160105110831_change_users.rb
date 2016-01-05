class ChangeUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email
    remove_column :users, :source

    change_column :users, :nickname, :string, null: false
  end
end
