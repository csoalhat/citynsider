class AddProfileIdToFavorite < ActiveRecord::Migration
  def change
    add_column :favorites, :profile_id, :integer
    add_column :favorites, :map_id, :integer
  end
end
