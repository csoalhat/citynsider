class Map < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :tips
end
