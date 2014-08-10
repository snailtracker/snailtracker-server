class Session < ActiveRecord::Base
  include ApiKeyable
  belongs_to :app
end
