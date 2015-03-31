class StatusMessage < ActiveRecord::Base
  attr_accessible :body, :category, :user_id
  validates :body, presence: true
  validates :user, presence: true

  belongs_to :user, inverse_of: :status_messages,
  foreign_key: :user_id
end