class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  helper_method :current_user, :logged_in?

  def current_user
  	session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || \
    (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end  

  # def logged_in?
  #   !!current_user
  # end

end
