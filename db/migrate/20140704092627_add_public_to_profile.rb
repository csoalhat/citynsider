class AddPublicToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :public, :boolean, default: true, null: false
  end
end
