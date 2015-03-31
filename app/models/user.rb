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
#  password        :string
#

class User < ActiveRecord::Base

  validates :email, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_one :profile, inverse_of: :user, dependent: :destroy, foreign_key: :user_id
  has_many :photos, through: :profile, source: :photos
  has_one :user_filter, inverse_of: :user, dependent: :destroy, foreign_key: :user_id

  has_many :messages,
  through: :message_headers,
  source: :message

  has_many :received_notifications,
  inverse_of: :receiver,
  class_name: "Notification",
  foreign_key: :receiver_id

  has_many :triggered_notifications,
  class_name: "Notification",
  foreign_key: :receiver_id

  has_many :message_headers,
  inverse_of: :user,
  dependent: :destroy,
  foreign_key: :user_id

  has_many :other_message_headers,
  class_name: "MessageHeader",
  foreign_key: :other_id

  has_many :status_messages,
  inverse_of: :user,
  dependent: :destroy,
  foreign_key: :user_id
end
