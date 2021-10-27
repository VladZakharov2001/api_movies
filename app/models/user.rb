class User < ApplicationRecord
  has_many :favorite_movies
  has_many :filters
  validates :username, presence: true, uniqueness: true  #не пустой и уникальный
  validates :password, presence: true, uniqueness: true
end
