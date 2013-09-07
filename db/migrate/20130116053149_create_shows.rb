class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.datetime :date
      t.string :venue
      t.text :address
      t.integer :price
      t.timestamps
    end
    add_index :shows, :date
    add_index :shows, :venue
    add_index :shows, :address
    add_index :shows, [:venue, :address]
    add_index :shows, :price
    add_index :shows, :created_at
  end
end
