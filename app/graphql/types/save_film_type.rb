module Types
  class SaveFilmType < Types::BaseObject
    field :id, ID, null: false
    field :external_film_id, Integer, null: true
    field :is_watched, Boolean, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
