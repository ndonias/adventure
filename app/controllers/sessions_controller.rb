class SessionsController < ApplicationController
	
	def create
		@user=User.find_by(email: params[:email])
		if @user and @user.password == params[:password]
			flash[:notice]= "Successfully signed in!"
			session[:user_id]=@user.id
			if current_user.profile ==nil
				redirect_to new_profile_path
			else
				redirect_to profiles_path
			end
		else
			flash[:alert] = "Something went wrong."
			redirect_to root_path
		end
	end

	def destroy
		session[:user_id]=nil
		flash[:notice]="Logged out."
		redirect_to root_path
	end
end
