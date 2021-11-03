class SaveFilmsController < ApplicationController
  def new
    @films = SaveFilm.new
  end

  def index
    @films = SaveFilm.all
    render json: @films.map{|f| "#{f.external_film_id}: #{f.is_watched}"}
  end

  def create
    @films = SaveFilm.create(save_films_params)
    render body: @films
  end

  private

  def save_films_params
    params.permit(:external_film_id, :is_watched)
  end
end
