# == Schema Information
#
# Table name: status_messages
#
#  id         :integer          not null, primary key
#  user_id    :string
#  category   :string
#  body       :string
#  created_at :datetime
#  updated_at :datetime
#

class StatusMessage < ActiveRecord::Base
  validates :body, presence: true
  validates :user, presence: true

  belongs_to :user, inverse_of: :status_messages,
  foreign_key: :user_id

end
