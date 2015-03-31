# == Schema Information
#
# Table name: notifications
#
#  id          :integer          not null, primary key
#  receiver_id :string
#  trigger_id  :string
#  status_type :string
#  is_read     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Notification < ActiveRecord::Base
  validates :is_read, inclusion: [true, false]
  validates :status_type, presence: true, inclusion: [0, 1]
  validates :receiver, presence: true

  validates :triggering_user, presence: true

  belongs_to :receiver,
  inverse_of: :received_notifications,
  class_name: "User",
  foreign_key: :receiver_id

  belongs_to :triggering_user,
  inverse_of: :triggered_notifications,
  class_name: "User",
  foreign_key: :trigger_id

  has_one :triggering_profile,
  through: :triggering_user,
  source: :profile

  has_many :triggerer_photos,
  through: :triggering_profile,
  source: :photos
end
