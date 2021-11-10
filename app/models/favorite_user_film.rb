class FavoriteUserFilm < ApplicationRecord
  belongs_to :user
  belongs_to :favorite_film
end
