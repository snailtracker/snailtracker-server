class Error < ActiveRecord::Base
  validates :session, presence: true
  belongs_to :session
  scope :recent_first, -> {order("updated_at desc")}
  has_one :app, through: :session

  def description
    "#{exception_class}: #{message}"
  end
end
