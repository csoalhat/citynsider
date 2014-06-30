class Rating < ActiveRecord::Base
  belongs_to :map
  belongs_to :profile
end
