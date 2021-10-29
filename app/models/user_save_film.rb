class UserSaveFilm < ApplicationRecord
  belongs_to :user
  belongs_to :save_film
end
