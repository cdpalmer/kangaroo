require './spec/support/webmock_onconnect_responses.rb'

class TheatresController < ApplicationController
  def index
    if params[:zip_code]
      @reference = params[:zip_code]
      @theatres = Theatre.select { |t| t.zipcodes.map(&:value).include?(params[:zip_code]) }

      respond_to do |f|
        f.json { render json: @theatres }
        f.html { render }
      end
    else
      @reference = 'all'
      @theatres = Theatre.all
    end
  end

  def show
    @theatre = Theatre.find(params[:id])
    @movies = @theatre.movies.uniq
    @marathons = @theatre.marathons

    respond_to do |f|
      # make a decorator or serializer for json. Needs movies and marathons
      f.json { render json: @theatre }
      f.html { render }
    end
  end
end
