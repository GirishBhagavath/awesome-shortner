require 'rails_helper'

RSpec.describe ShortenUrlsController, type: :controller do

  describe "GET show" do
    it "should redirect to actual url if token is valid" do
      shortened_url = Shortner::ShortenedUrl.create!(url: "http://google.in")
      get :show, {:id => shortened_url.unique_key}
      expect(response).to redirect_to(shortened_url.url)
    end

    it "should give error if token is invalid" do
      get :show, {:id => 'invalid_key'}
      expect(response).to render_template(:show)
    end
  end

  describe "POST create" do
    it "should give shortened_url if valid url" do
      request.accept = "application/json"
      post :create, {:url => "http://google.com"}
      expect(response.status).to eq(200)
    end

    it "should give error status if invalidvalid url" do
      request.accept = "application/json"
      post :create, {:url => "invliad_url.com"}
      expect(response.status).to eq(422)
    end
  end

end
