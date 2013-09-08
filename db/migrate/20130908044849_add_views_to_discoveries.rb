class AddViewsToDiscoveries < ActiveRecord::Migration
  def change
    add_column :discoveries, :views, :integer, default: 0
    add_index :discoveries, :views
  end
end
