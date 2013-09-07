class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :album_id
      t.string :title
      t.string :description
      t.string :thumbnail

      t.timestamps
    end
    add_index :photos, :album_id
  end
end
