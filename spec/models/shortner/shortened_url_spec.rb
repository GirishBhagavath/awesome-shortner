require 'rails_helper'

RSpec.describe Shortner::ShortenedUrl, type: :model do
  context "Creating Shortened Url" do
    it "should create a shortened url" do
      shortened_url = Shortner::ShortenedUrl.create(url: "http://google.in")
      expect(shortened_url).to be_valid
    end
    
    it "should not create a shortened url" do
      shortened_url = Shortner::ShortenedUrl.create(url: "invliad_url.com")
      expect(shortened_url).not_to be_valid
    end
  end
end
