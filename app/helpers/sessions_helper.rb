module SessionsHelper
  def session_item_class(item)
    "bg-#{item.is_a?(Action) ? 'success' : 'danger'}"
  end
end
