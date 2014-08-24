class Api::ErrorsController < ApplicationController
  include Api

  def create
    error = Error.new(error_params)
    error.session = @session
    error.save
    render_api_create_response error
  end

  private

  def error_params
    params.require(:error).permit(:exception_class, :message)
  end
end
