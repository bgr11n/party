class AllowDataNullIdentity < ActiveRecord::Migration
  def change
    change_column :user_identities, :data, :text, null: true
  end
end
