class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :city
      t.string :description
      t.string :photo
      t.boolean :public
      t.references :user, index: true

      t.timestamps
    end
  end
end
