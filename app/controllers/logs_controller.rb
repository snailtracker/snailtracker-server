class LogsController < ApplicationController
  include Api

  def create
    log = Log.new(log_params)
    log.log_type = LogType.find_by_name(params[:log][:log_type_name])
    log.app = @app
    log.save
    render_api_create_response log
  end

  private

  def log_params
    params.require(:log).permit(:log_type_id, :app_id, :message)
  end
end
