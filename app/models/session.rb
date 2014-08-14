class Session < ActiveRecord::Base
  include ApiKeyable
  belongs_to :app
  has_many :actions
end
