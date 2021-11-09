module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :add_favorite_film, mutation: Mutations::AddFavoriteFilmMutation
    field :add_genre, mutation: Mutations::AddGenreMutation
    field :add_iswatched, mutation: Mutations::AddIswatchedMutation
    field :delete_favorite_film, mutation: Mutations::DeleteFavoriteFilmMutation
    field :delete_genre, mutation: Mutations::DeleteGenreMutation
  end
end
