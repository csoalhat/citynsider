class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "user"
      can :manage, [Profile, Favorite], user_id: user.id
      can :show, Profile, public: true
    else
      cannot :read, :all
    end
  end
end
