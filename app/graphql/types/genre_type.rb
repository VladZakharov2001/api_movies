module Types
  class GenreType < Types::BaseObject
    field :id, ID, null: false
    field :external_genre_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
