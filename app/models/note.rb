class Note < ActiveRecord::Base
  belongs_to :session
  belongs_to :app
end
