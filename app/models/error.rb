class Error < ActiveRecord::Base
  validates :session, presence: true
  belongs_to :session
  has_one :app, through: :session
end
