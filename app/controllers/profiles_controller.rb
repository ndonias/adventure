class ProfilesController < ApplicationController
  
  def index
    @user_filter = current_user.user_filter
    current_user_pid = current_user.profile.id
    @profiles = Profile.apply_filters(@user_filter, current_user)
    .page(params[:page])

    if @profiles.blank?
      flash.now[:errors] = "There are no more profiles for your action with your current search filters. Please broaden your criteria above and try again. Displaying everyone."
      @profiles = Profile.page(params[:page])
    end
  end

  def create
    @user = User.find(session[:user_id])
    @user.build_profile(profile_params)
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
    @profile = current_user.profile

    if @profile.update_attributes(params[:profile])
      render :json => @profile
    else
      render :json => @profile.errors.full_messages
    end
  end

  def show
    @profile = Profile.find(params[:id])
    @message = Message.new
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(:hiking, :yoga, :dance, :weights, :running, :biking, :swimming, :rocks, :bio, :sex, :birthday, :city, :zip_code, photos_attributes:[:file, :profile_id])
  end
  
end
