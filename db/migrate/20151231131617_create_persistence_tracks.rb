class CreatePersistenceTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :uri
      t.string :title
      t.string :thumbnail
      t.integer :duration

      t.timestamps null: false
    end
    add_index :tracks, :uri
  end
end
