class UsersController < ApplicationController

  def new 
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Success, Please Login"
      redirect_to login_path
    else 
      flash[:error] = "Error"
      redirect_to new_user_path
    end 
  end 

  private 
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end  
end