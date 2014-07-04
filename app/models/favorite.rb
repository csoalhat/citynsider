class Favorite < ActiveRecord::Base
  belongs_to :profile
  belongs_to :map

  acts_as_votable
end

@favorite = Favorite.new(:name => 'my favorite!')
@favorite.save

@favorite.liked_by @user.profile.name
@favorite.votes_for.size # => 1