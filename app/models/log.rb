class Log < ActiveRecord::Base
  belongs_to :log_type
  belongs_to :session

  validates :log_type, presence: true
  validates :message, presence: true
  validates :session, presence: true
end
