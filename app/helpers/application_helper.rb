module ApplicationHelper

	def current_user
  		session[:user_id] ? User.find(session[:user_id]) : nil
    end

  def display_photo(profile, type)
    url = if profile && profile.photos.exists?
            profile.photos.first.file.url(:avatar)
          else
            asset_path "img_placeholder.png"
          end

    "<img src=\"#{url}\" height=\"100%\" width=\"100%\">".html_safe
  end

  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || \
    (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end
end
