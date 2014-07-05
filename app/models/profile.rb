class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :maps
end
