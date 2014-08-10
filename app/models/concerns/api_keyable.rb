
module ApiKeyable
  extend ActiveSupport::Concern
  included do
    API_KEY_LENGTH = 20
    after_create :generate_api_key
  end

  # Generate a unique api key
  def generate_api_key
    begin
      api_key = SecureRandom.urlsafe_base64(self.class::API_KEY_LENGTH)
    end while(self.class.where({api_key: api_key}).count > 0)
    self.api_key = api_key
    save
  end
end