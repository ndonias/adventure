# == Schema Information
#
# Table name: profiles
#
#  id                 :integer          not null, primary key
#  user_id            :string
#  sex                :string
#  sexual_orientation :string
#  bio                :text
#  weights            :boolean
#  running            :boolean
#  biking             :boolean
#  swimming           :boolean
#  rocks              :boolean
#  hiking             :boolean
#  yoga               :boolean
#  dance              :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  latitude           :float
#  longitude          :float
#  zip_code           :integer
#  city               :string
#  birthday           :date
#

class Profile < ActiveRecord::Base
	
  validates :user, presence: :true
  validates :birthday, presence: :true
  validates :zip_code, presence: true, numericality: true, length: { is: 5 }
	
  geocoded_by :zip_code
		reverse_geocoded_by :latitude, :longitude do |obj, results|
			if geo = results.first
			  obj.city = geo.city
			  obj.zip_code = geo.postal_code
			end
		end
	after_validation :geocode, :reverse_geocode

	belongs_to :user, inverse_of: :profile, foreign_key: :user_id, dependent: :destroy
	has_many :photos, inverse_of: :profile, dependent: :destroy

  def self.apply_filters(filter, current_user)
    return Profile.all if filter.nil?

    results = Profile.where("id != ?", current_user.profile.id)

    unless filter.sex.nil? || filter.sex == -1
      results = results.where(:sex => filter.sex)
    end

    unless filter.beg_age.nil? && filter.end_age.nil?
      start_date =
      ((filter.beg_age.nil?) ? 18 : filter.beg_age).years.ago

      end_date =
      ((filter.end_age.nil?) ? 99 : filter.end_age).years.ago

      results = results.where(:birthday => end_date..start_date)
    end

    unless filter.sexual_orientation.nil? || filter.sexual_orientation == -1
      results = results.where(:sexual_orientation => filter.sexual_orientation)
    end

    unless filter.distance.nil?
      results.reject! do |result|
        current_user.profile.distance_to(result) > filter.distance
      end
    end

    return results
  end

end
