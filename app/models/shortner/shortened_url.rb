require 'uri'
class Shortner::ShortenedUrl

  include Mongoid::Document
  include Mongoid::Timestamps
  field :url, type: String
  field :unique_key, type: String

  validates_format_of :url, with: URI.regexp , presence: true
  before_create :generate_unique_key

  def as_json(options ={})
    {parsed_url: get_parsed_url, url: self.url}
  end

  def get_parsed_url
    "#{AWESOME_DOMAIN['url_domain']}#{self.unique_key}"
  end

  protected


  def generate_unique_key
    self.unique_key = loop do
      random_token = SecureRandom.hex(6)
      break random_token unless Shortner::ShortenedUrl.where(unique_key: random_token).present?
    end
  end

end
