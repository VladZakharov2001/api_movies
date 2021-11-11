module Mutations
    class AddFavoriteFilmMutation < BaseMutation
        argument :favorite_film, ID, required: true
        field :errors,[String], null: false
        def resolve(favorite_film:)
            user = context[:current_user]
            film = FavoriteFilm.where(external_film_id:favorite_film).first_or_initialize

            if film.save
                user.favorite_films << film unless user.favorite_films.exists?(film.id)
                {
                    errors:[]
                }
            else
                { errors: film.errors.full_messages }
            end
        end
    end
end
