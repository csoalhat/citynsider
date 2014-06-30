class Tip < ActiveRecord::Base
  belongs_to :map
  belongs_to :profile
end
