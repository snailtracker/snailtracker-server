class ActionsController < ApplicationController
  include Api

  def create
    action = Action.new(action_params)
    action.session = @session
    action.action_type = ActionType.find_by_name(params[:action][:action_type_name])
    action.save
    render_api_create_response action
  end

  private

  def action_params
    params.require(:action).permit(:url, :selector)
  end
end
