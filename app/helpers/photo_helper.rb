module PhotoHelper

	def display_photo(profile, type)
    url = if profile && profile.photos.exists?
            profile.photos.first.file.url(:avatar)
          else
            asset_path "img_placeholder.png"
          end

    "<img src=\"#{url}\" height=\"100%\" width=\"100%\">".html_safe
  end
  
end
