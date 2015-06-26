class QueriesController < ApplicationController
  def index
    wipe_old_data if Query.last && !Query.last.created_at.today?

    @queries = Query.all
    @zip_code = Query.new
  end

  def create
    @query = Query.new(query_params)

    if @query.valid?
      if known_zip?(@query.zip_code)
        redirect_to movies_path, notice: "That zip has already been searched today."
      else
        @query.save
        movie_service = MovieService.new
        output = movie_service.find_by_zipcode(@query.zip_code)
        movie_service.parse_zipcode_payload(output, @query.zip_code)
        redirect_to movies_path(zip: @query.zip_code)
      end
    else
      redirect_to queries_path, alert: "Zip must be a 5 digit number"
    end

    # -- Or run against mocked response for local debugging --
    # @movie_service.parse_zipcode_payload(
    #   WebmockOnconnectResponse.zipcode_response(80222))
  end

private

  def wipe_old_data
    Query.destroy_all
    Showtime.destroy_all
    Movie.destroy_all
  end

  def query_params
    params[:query].permit(:zip_code)
  end

  def known_zip?(zip)
    Query.all.map(&:zip_code).include?(zip.to_i)
  end
end
