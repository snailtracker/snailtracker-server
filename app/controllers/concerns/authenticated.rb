
module Authenticated
  extend ActiveSupport::Concern

  included do
    before_filter :require_user_authentication
  end

  def require_user_authentication
    redirect_to :root unless current_user
  end
end