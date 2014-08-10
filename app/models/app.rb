class App < ActiveRecord::Base
  include ApiKeyable
  validates :name, presence: true, uniqueness: true

  has_many :logs
  has_many :actions
  has_many :notes

end
