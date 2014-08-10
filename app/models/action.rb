class Action < ActiveRecord::Base
  belongs_to :session
  belongs_to :action_type

  has_one :app, through: :session
end
