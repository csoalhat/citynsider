class AddKeywordMapcenterToMap < ActiveRecord::Migration
  def change
    add_column :maps, :keyword, :string
    add_column :maps, :mapcenter, :string
    add_column :maps, :yelp_generated, :boolean
  end
end
