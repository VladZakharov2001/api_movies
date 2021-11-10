class FavoriteUserFilm < ApplicationRecord
  belongs_to :user
  belongs_to :favorite_film
  validates :favorite_film_id, numericality: { only_integer: true }, uniqueness: true
end
