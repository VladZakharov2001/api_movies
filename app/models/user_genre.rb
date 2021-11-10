class UserGenre < ApplicationRecord
    belongs_to :user
    belongs_to :genre
    validates :genre_id, numericality: { only_integer: true }, uniqueness: true
end
  