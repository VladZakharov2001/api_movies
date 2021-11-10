module Mutations
    class AddFavoriteFilmMutation < BaseMutation
        argument :film, ID, required: true
        field :errors,[String], null: false
        def resolve(film:)
            user = context[:current_user]
            film = user.favorite_films << FavoriteFilm.where(external_film_id:film).first_or_initialize
            { errors: film ? [] : film.errors.full_messages }
        end
    end
end
