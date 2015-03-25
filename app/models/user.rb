# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  email           :string
#  password_digest :string
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base

  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_one :profile, inverse_of: :user, dependent: :destroy, foreign_key: :user_id
  has_many :photos, through: :profile, source: :photos
  has_one :user_filter, inverse_of: :user, dependent: :destroy, foreign_key: :user_id

end
