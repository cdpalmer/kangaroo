require './spec/support/webmock_onconnect_responses.rb'

class TheatresController < ApplicationController
  def index
    @theatres = Theatres.al
  end

  def show
    @theatre = Theatre.where(id: params[id])
  end
end
