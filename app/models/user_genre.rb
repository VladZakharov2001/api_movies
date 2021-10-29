class UserGenre < ApplicationRecord
    belongs_to :user
    belongs_to :genre, primary_key: :external_genre_id
  end
  