class AddProviderAndUidAndNameAndImageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :udi, :string
    add_column :users, :name, :string
    add_column :users, :image, :string
  end
end
