class CreatePersistenceUserIdentities < ActiveRecord::Migration
  def change
    create_table :user_identities do |t|
      t.belongs_to :user, null: false, index: true
      t.string :email, null: false, index: true
      t.string :source, null: false
      t.text :data, null: false

      t.timestamps null: false
    end
  end
end
