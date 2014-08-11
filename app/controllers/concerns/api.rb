
module Api
  extend ActiveSupport::Concern

  included do
    before_filter :authenticate_api_key
    before_filter :set_session

    before_filter :cors_preflight_check
    after_filter :cors_set_access_control_headers
    protect_from_forgery :except => :create
  end

  def render_api_create_response(resource)
    render_api_response resource, ! resource.new_record?
  end

  def render_api_response(resource, success)
    resource_key = resource.class.to_s.underscore
    if success
      return render json: {success: true, :"#{resource_key}" => resource.attributes, errors: []}
    else
      return render json: {success: false, :"#{resource_key}" => resource.attributes, errors: resource.errors, error_message: resource.errors.full_messages.to_sentence}
    end
  end

  def set_session
    @session = Session.find_by_api_key(params[:session_api_key])
  end

  def authenticate_api_key
    api_key = params[:api_key]
    @app = App.find_by_api_key(api_key)
    return unauthenticated if api_key.nil? or @app.nil?
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def cors_preflight_check
    if request.method == :options
      cors_set_access_control_headers
      render text: '', content_type: 'text/plain'
    end
  end

  def unauthenticated
    render json: {success: false, errors: ["Invalid API Key"]}
  end
end