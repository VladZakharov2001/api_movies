class SaveFilmsController < ApplicationController
  def new
    @films = SaveFilm.new
  end

  def index
    @films = SaveFilm.all
    render json: @films
  end
  def create
    @film = SaveFilm.create(save_films_params)
    render body: @film
  end

  private

  def save_films_params
    params.permit(:external_film_id, :is_watched)
  end
end
