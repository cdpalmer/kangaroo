class QueriesController < ApplicationController
  def index
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
        redirect_to movies_path
      end
    else
      redirect_to queries_path, alert: "Zip must be a 5 digit number"
    end

    # Create new query in db and run query against movie service endpoint
    # @movie_service = MovieService.new
    # output = @movie_service.find_by_zipcode(80222)
    # @movie_service.parse_zipcode_payload(output)
    #
    # -- Or run against mocked response for local debugging --
    # @movie_service.parse_zipcode_payload(
    #   WebmockOnconnectResponse.zipcode_response(80222))
  end

private

  def query_params
    params[:query].permit(:zip_code)
  end

  def valid_zip?
    zip = query_params[:zip_code][/\A\d{5}\z/]
    Query.all.map(&:zip_code).include?(zip.to_i) if zip
  end

  def known_zip?(zip)
    Query.all.map(&:zip_code).include?(zip.to_i)
  end
end
