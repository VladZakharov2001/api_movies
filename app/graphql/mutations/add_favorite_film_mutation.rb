module Mutations
    class AddFavoriteFilmMutation < BaseMutation
        argument :film, ID, required: true
    
        field :errors,[String], null: false

        def resolve(film:)
            user = context[:current_user]
            film = FavoriteFilm.where(external_film_id:film).first_or_initialize

            if(!(FavoriteUserFilm.where(user_id:user.id,favorite_film_id:film.id).any?))
                user.favorite_films << film
                {
                    errors:[]
                }
            end
        end
    end
end
