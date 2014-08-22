class Session < ActiveRecord::Base
  include ApiKeyable
  include ActionView::Helpers::DateHelper
  belongs_to :app
  has_many :actions

  def description
    "User ID: #{user_id || "unknown"} Name: #{user_name || "unknown"} Duration: #{duration}"
  end

  def duration
    return if actions.count < 2
    seconds = actions.last.updated_at - actions.first.updated_at
    distance_of_time_in_words(seconds)
  end
end
