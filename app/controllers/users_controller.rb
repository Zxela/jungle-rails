class UsersController < ApplicationController

def new
end

def create
  user = User.new(user_params)
  if user.save
    session[:user_id] = user.id
    redirect_to '/', notice: "You have successfully registered a new account!"
  else
    redirect_to '/signup', notice: "Email already in use"
  end
end
  
private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
