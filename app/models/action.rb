class Action < ActiveRecord::Base
  belongs_to :session
  belongs_to :action_type
  belongs_to :app
end
