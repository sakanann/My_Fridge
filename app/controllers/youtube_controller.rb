class YoutubeController < ApplicationController
  require 'google/apis/youtube_v3'
  def find_videos(keyword, after: 1.year.ago, before: Time.now)
    service = Google::Apis::YoutubeV3::YouTubeService.new
    service.key = ENV['GOOGLE_API_KEY']

    next_page_token = nil
    opt = {
      q: keyword,
      type: "video",
      max_results: 1,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601,
    }
    service.list_searches(:snippet, **opt)
  end

  def index
    @check = params[:search]
    @youtube_data = []
    if @check.present?
      @youtube_data = find_videos(@check)
    end
  rescue StandardError => e
    flash.now[:error] = "Error occurred: #{e.message}"
  end
end
