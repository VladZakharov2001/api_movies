module Mutations
    class AddFavoriteFilmMutation < BaseMutation
        argument :film, ID, required: true
    
        field :errors,[String], null: false

        def resolve(film:)
            user = context[:current_user]
            film = user.favorite_films << FavoriteFilm.create(external_film_id:film)
            if(film)
            {
               errors:[]
            }
            else
            {
                errors: film.errors.full_messages
            }
            end
        end
    end
end
