
module Api
  extend ActiveSupport::Concern

  included do
    before_filter :authenticate_api_key
    protect_from_forgery :except => :create
  end

  def render_api_response(resource, success)
    if success
      return render json: {success: true, errors: []}
    else
      return render json: {success: false, errors: resource.errors, error_message: resource.errors.full_messages.to_sentence}
    end
  end

  def authenticate_api_key
    api_key = params[:api_key]
    @app = App.find_by_api_key(api_key)
    return unauthenticated if api_key.nil? or @app.nil?
  end

  def unauthenticated
    render json: {success: false, errors: ["Invalid API Key"]}
  end
end