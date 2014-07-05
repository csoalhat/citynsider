class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :coordinates
      t.string :name
      t.string :description
      t.references :profile, index: true

      t.timestamps
    end
  end
end
