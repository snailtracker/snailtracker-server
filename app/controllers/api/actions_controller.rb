class Api::ActionsController < ApplicationController
  include Api

  def create
    action = Action.new(action_params)
    action.session = @session
    action.action_type = ActionType.find_by_name(params[:app_action][:action_type_name])
    action.session = Session.find_by_api_key(params[:app_action][:session_api_key])
    action.save
    render_api_create_response action
  end

  private

  def action_params
    params.require(:app_action).permit(:url, :selector, :target_text, :keycode, :char, :target_value)
  end
end
