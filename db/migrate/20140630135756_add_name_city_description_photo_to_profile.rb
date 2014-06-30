class AddNameCityDescriptionPhotoToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :name, :string
    add_column :profiles, :city, :string
    add_column :profiles, :description, :string
    add_column :profiles, :photo, :string
  end
end
