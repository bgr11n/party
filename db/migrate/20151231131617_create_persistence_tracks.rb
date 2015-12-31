class CreatePersistenceTracks < ActiveRecord::Migration
  def change
    create_table :persistence_tracks do |t|
      t.string :uri
      t.string :title
      t.string :thumbnail
      t.integer :duration

      t.timestamps null: false
    end
    add_index :persistence_tracks, :uri
  end
end
