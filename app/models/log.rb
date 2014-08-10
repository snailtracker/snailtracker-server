class Log < ActiveRecord::Base
  belongs_to :log_type
  belongs_to :session

  validates :log_type, presence: true
  validates :message, presence: true
  validates :session, presence: true

  has_one :app, through: :session
end
