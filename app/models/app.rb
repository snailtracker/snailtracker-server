class App < ActiveRecord::Base
  include ApiKeyable
  validates :name, presence: true, uniqueness: true

  has_many :logs
  has_many :actions
  has_many :notes
  has_many :sessions
  has_many :user_errors, through: :sessions, class_name: "Error", foreign_key: :error_id
end
