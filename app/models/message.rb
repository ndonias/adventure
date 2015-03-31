# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Message < ActiveRecord::Base
  
  validates :body, presence: true

  has_many :message_headers,
  inverse_of: :message,
  dependent: :destroy,
  foreign_key: :message_id

end
