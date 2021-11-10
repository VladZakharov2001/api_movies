class FavoriteFilm < ApplicationRecord
  has_many :favorite_user_films, dependent: :destroy
  has_many :users, through: :favorite_user_films, dependent: :destroy
  validates :external_film_id, presence: true, numericality: { only_integer: true }, uniqueness: true
end
