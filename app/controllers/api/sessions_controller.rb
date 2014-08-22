class Api::SessionsController < ApplicationController
  include Api
  def create
    session = Session.new(session_params)
    session.app = @app
    session.save
    render_api_create_response session
  end

  private
  def session_params
    params.require(:session).permit(:user_id, :user_name, :email, :browser)
  end
end
