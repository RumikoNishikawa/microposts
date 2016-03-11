class UsersController < ApplicationController
before_action :collect_user, only: [:edit, :update]
before_action :logged_in_user, only: [:index, :edit, :update, :destroy,
                                        :following, :followers]

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
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
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.follower_users
    render 'show_follow'
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
