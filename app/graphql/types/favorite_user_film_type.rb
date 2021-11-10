module Types
  class FavoriteUserFilmType < Types::BaseObject
    field :id, ID, null: false
    field :user_id, Integer, null: true
    field :favorite_film_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
