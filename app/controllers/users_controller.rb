class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy]  
  
  def index
  	@users= User.all
  end

  def new
  	@user=User.new
  end

  def show
  end

  def create
  	@user = User.new(user_params)
    if @user.save
  	 redirect_to profile_path, notice: "New user created"
    else
      render :new
    end
  end

  def update
  end

  private 

  def set_user
  	@user=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :username, :password)
  end
  
end
