# == Schema Information
#
# Table name: photos
#
#  id                :integer          not null, primary key
#  profile_id        :integer
#  file_file_name    :string
#  file_content_type :string
#  file_file_size    :integer
#  file_updated_at   :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Photo < ActiveRecord::Base

	validates :file, presence: true
	validates :profile, presence: true

	has_attached_file :file, default_url: ActionController::Base.helpers.asset_path("img_placeholder.png"), :styles => {:featured => "840x>", :browse => "460x460#", :avatar => "200x200#", :thumb => "60x60#"}

	belongs_to :profile,
	inverse_of: :photos

	 include Rails.application.routes.url_helpers
	 
	 def to_jq_upload
	    {
	      "name" => read_attribute(:file_file_name),
	      "size" => read_attribute(:file_file_size),
	      "url" => upload.url(:original),
	      "delete_url" => upload_path(self),
	      "delete_type" => "DELETE" 
	    }
  	end

end
