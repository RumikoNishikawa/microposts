class UsersController < ApplicationController
before_action :collect_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "Welcome to Rumiko's App! Please Enjoy!"
      redirect_to @user
    else
      render 'new'
    end
  end
      
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = "Welcome to Rumiko's App! Please Enjoy!"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
 
  def collect_user
    user = User.find(params[:id])
    redirect_to(root_url) if user != current_user
  end 
  
  def user_params
    params.require(:user).permit(:name, :email, :location, :introduction, :password,:password_comfirmation)
  end
  
  
end
