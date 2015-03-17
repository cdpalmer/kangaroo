require './spec/support/webmock_onconnect_responses.rb'

class TheatresController < ApplicationController
  def index
    @theatres = Theatre.all
  end

  def show
    @theatre = Theatre.find(params[:id])
    @marathons = @theatre.marathons
  end
end
