class User < ApplicationRecord
  has_many :favorite_user_films, dependent: :destroy
  has_many :favorite_films, through: :favorite_user_films, dependent: :destroy
  has_many :user_genres, dependent: :destroy
  has_many :genres, through: :user_genres, dependent: :destroy
  validates :username, presence: true, uniqueness: { case_sensitive: true }
  validates :password, presence: true
end
