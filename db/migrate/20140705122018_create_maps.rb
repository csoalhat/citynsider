class CreateMaps < ActiveRecord::Migration
  def create
    create_table :maps do |t|
      t.string :coordinates
      t.string :name
      t.string :description
      t.references :user, index: true

      t.timestamps
    end
  end
end
