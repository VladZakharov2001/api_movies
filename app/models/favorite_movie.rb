class FavoriteMovie < ApplicationRecord
  belongs_to :user
  validates :id_film, presence: true, uniqueness: true
  validates :is_watched, presence: true
end
