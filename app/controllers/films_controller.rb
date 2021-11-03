class FilmsController < ApplicationController
  def show
    render json: GetData.info_film_by_id(params[:id])
  end
end
