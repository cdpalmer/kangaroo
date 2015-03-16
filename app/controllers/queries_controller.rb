class QueriesController < ApplicationController
  http_basic_authenticate_with name: 'cody', password: 'palmer'

  def index
    @whatever = 'immaina index'
  end

  def create
    @whatever = 'hello world! I am authenticated'
  end
end
