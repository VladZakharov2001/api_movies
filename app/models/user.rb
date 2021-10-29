class User < ApplicationRecord
    has_many :user_save_films, dependent: :destroy
    has_many :save_films, through: :user_save_films, :source => :save_film, dependent: :destroy
    has_many :user_genres, dependent: :destroy
    has_many :genres, through: :user_genres, :source => :genre, dependent: :destroy
    validates :username, presence: true, uniqueness: { case_sensitive: true }
    validates :password, presence: true
  end
  