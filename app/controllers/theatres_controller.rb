require './spec/support/webmock_onconnect_responses.rb'

class TheatresController < ApplicationController
  def index
    # @movie_service = MovieService.new
    # @movie_service.parse_zipcode_payload(WebmockOnconnectResponse.zipcode_response(80222))
    @theatres = Theatre.all
  end

  def show
    @theatre = Theatre.find(params[:id])
  end
end
