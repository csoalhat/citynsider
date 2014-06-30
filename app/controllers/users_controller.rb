class UsersController < Devise::RegistrationsController

  def index
    @users = User.all
  end

  def create
    # run default version defined in Devise::RegistrationsController
    super

    # then add our custom logic
    @user.role = "user"
    @user.save
  end

end