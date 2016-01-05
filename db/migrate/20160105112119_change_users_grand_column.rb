class ChangeUsersGrandColumn < ActiveRecord::Migration
  def change
    change_column :users, :grand, :boolean, null: false
  end
end
