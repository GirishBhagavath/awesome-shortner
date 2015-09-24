class ShortenUrlsController < ApplicationController
  def create
    @shortened_url = Shortner::ShortenedUrl.new(url: params[:url])
    respond_to do |format|
      if @shortened_url.save
        format.json{render json: @shortened_url, status: :ok}
        format.xml
      else
        format.json{render json: {error: 'Invalid url', error_code: 'E0001'}, status: 422}
        format.xml{render template: 'create_error' }
      end
    end
  end

  def show
    @shortened_url = Shortner::ShortenedUrl.where(unique_key: params[:id]).first
    if @shortened_url.present?
      redirect_to @shortened_url.url
    end
  end
end
