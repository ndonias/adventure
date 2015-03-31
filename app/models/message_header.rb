class MessageHeader < ActiveRecord::Base
  validates :is_sent, :is_read, inclusion: [true, false]
  validates :user, presence: true
  validates :message, presence: true

  belongs_to :user,
  inverse_of: :message_headers,
  foreign_key: :user_id

  belongs_to :other_user,
  class_name: "User",
  foreign_key: :other_id

  belongs_to :message, inverse_of: :message_headers,
  foreign_key: :message_id

end
