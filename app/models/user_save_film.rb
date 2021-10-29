class UserSaveFilm < ApplicationRecord
    belongs_to :user
    belongs_to :save_film, primary_key: :external_film_id
  end
  