require './spec/support/webmock_onconnect_responses.rb'

class TheatresController < ApplicationController
  def index
    if params[:zip_code]
      @reference = params[:zip_code]
      @theatres = Theatre.select { |t| t.zipcodes.map(&:value).include?(params[:zip_code]) }
    else
      @reference = 'all'
      @theatres = Theatre.all
    end
  end

  def show
    @theatre = Theatre.find(params[:id])
    @marathons = @theatre.marathons
  end
end
