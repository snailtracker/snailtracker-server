class Action < ActiveRecord::Base
  belongs_to :session
  belongs_to :action_type

  has_one :app, through: :session

  def description
    return "" unless action_type
    begin
      self.send "#{action_type.name}_description"
    rescue
      "UNDESCRIBED #{action_type.name}"
    end
  end
  def change_description
    "changed #{selector} to #{target_value}"
  end
  def click_description
    "clicked #{target_text || selector}"
  end
  def focus_description
    "focus #{target_value}"
  end
  def blur_description
    "blur #{target_value}"
  end
end
