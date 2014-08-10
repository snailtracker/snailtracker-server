class App < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  has_many :logs
  has_many :actions
  has_many :notes

  after_create :generate_api_key

  # Generate a unique api key
  def generate_api_key
    begin
      api_key = SecureRandom.urlsafe_base64(20)
    end while(self.class.where({api_key: api_key}).count > 0)
    self.api_key = api_key
    save
  end
end
