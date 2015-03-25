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

	validates_attachment_content_type :file, :content_type => /\Aimage\/.*\Z/

	belongs_to :profile,
	inverse_of: :photos

end
