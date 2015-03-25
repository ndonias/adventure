class ProfilesController < ApplicationController
  
  def index
    @profile = Profile.all
  end

  def create
    @user = User.find(session[:user_id])
    @user.build_profile(params.require(:profile).permit(:bio, :sex, :birthday, :city, :zip_code))
    if @user.profile.save
      redirect_to profile_path(@user.profile)
    else
       render :new
    end
  end

  def edit
    @profile = current_user.profile
  end

  def update
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def destroy
  end

end
