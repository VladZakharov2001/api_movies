class SaveFilmsController < ApplicationController
  def new
    @films = SaveFilm.new
  end

  def index
    @films = SaveFilm.all
    render body: @films.map{|f| "#{f.external_film_id}: #{f.is_watched}"}
  end

  def create
    SaveFilm.create(save_films_params)
    render body: "created"
  end

  private

  def save_films_params
    params.permit(:external_film_id, :is_watched)
  end
end
