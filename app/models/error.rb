class Error < ActiveRecord::Base
  validates :session, presence: true
  belongs_to :session
  scope :recent_first, -> {order("updated_at desc")}
  has_one :app, through: :session
end
