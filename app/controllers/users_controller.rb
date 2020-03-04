class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  
  def create
    @user = User.new(user_params)
   session[:user_id] = @user.id
   redirect_to '/welcome'
  end
  
  private
   def user_params
     params.require(:user).permit(:fname, :lname, :email, :username,        
   :password)
   end
  
end
