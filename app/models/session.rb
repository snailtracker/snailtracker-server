class Session < ActiveRecord::Base
  include ApiKeyable
  include ActionView::Helpers::DateHelper
  belongs_to :app
  has_many :actions
  has_many :user_errors, class_name: "Error"

  def actions_and_errors
    (actions + user_errors).sort do |a, b|
      a.updated_at <=> b.updated_at
    end
  end

  def description
    "User ID: #{user_id || "unknown"} Name: #{user_name || "unknown"} Duration: #{duration}"
  end

  def duration
    return if actions.count < 2
    seconds = actions.last.updated_at - actions.first.updated_at
    distance_of_time_in_words(seconds)
  end
end
