class FilmsController < ApplicationController
  def show
    @response = GetData.new.info_film_by_id(408)
    render json: @response
  end
end
