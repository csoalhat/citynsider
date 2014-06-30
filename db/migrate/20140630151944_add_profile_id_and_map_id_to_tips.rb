class AddProfileIdAndMapIdToTips < ActiveRecord::Migration
  def change
    add_column :tips, :map_id, :integer
  end
end
