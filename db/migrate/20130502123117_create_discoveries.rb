class CreateDiscoveries < ActiveRecord::Migration
  def change
    create_table :discoveries do |t|
      t.string :title
      t.string :person
      t.text :content
      t.string :thumbnail

      t.timestamps
    end
  end
end
