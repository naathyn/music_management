class AddSlugToDiscoveriesAndBlogs < ActiveRecord::Migration
  def change
    add_column :discoveries, :slug, :string
    add_column :blogs, :slug, :string
    add_index :discoveries, :slug, unique: true
    add_index :blogs, :slug, unique: true
  end
end
