class UserNicknameNotNull < ActiveRecord::Migration
  def change
    change_column :users, :nickname, :string, limit: 40
  end
end
