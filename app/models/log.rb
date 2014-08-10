class Log < ActiveRecord::Base
  belongs_to :log_type
  belongs_to :app

  validates :log_type, presence: true
  validates :message, presence: true
  validates :app, presence: true
end
