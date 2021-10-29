class Genre < ApplicationRecord
    self.primary_key = "external_genre_id"
    has_many :user_genres, dependent: :destroy
    has_many :users, through: :user_genres, dependent: :destroy
    validates :external_genre_id, presence: true, numericality: { only_integer: true }, uniqueness: true
  end
  