class AddProfileIdToTip < ActiveRecord::Migration
  def change
    add_column :tips, :profile_id, :integer
  end
end
