class SessionsController < ApplicationController

  def new 
  end

  def create
    @user = User.find_by(email: user_params[:email])

    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      flash[:succes] = "Success - Welcome"
      redirect_to links_path
    else 
      flash[:error] = "Incorrect Email/Password"
      redirect_to login_path
    end 
  end  

  def destroy 
    session.clear
    flash[:success] = "Success You have Been Logged Out"
    redirect_to root_path
  end 


  private 
    def user_params
      params.require(:session).permit(:email, :password)
    end
end