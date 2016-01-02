class CreatePersistenceUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :email
      t.string :source
      t.boolean :grand, default: false
      t.string :password_salt
      t.string :password_hash

      t.timestamps null: false
    end
    add_index :users, :email
    add_index :users, :nickname
  end
end
