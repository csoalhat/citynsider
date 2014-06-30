class Favorite < ActiveRecord::Base
  belongs_to :profile
  belongs_to :map
end
