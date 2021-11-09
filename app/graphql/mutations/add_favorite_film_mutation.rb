module Mutations
    class AddFavoriteFilmMutation < BaseMutation
        argument :film, ID, required: true
    
        field :errors,[String], null: false

        def resolve(film:)
            user = context[:current_user]
            film = SaveFilm.where(external_film_id:film).first_or_initialize

            if(!(UserSaveFilm.where(user_id:user.id,save_film_id:film.id).any?))
                user.save_films << film
                {
                    errors:[]
                }
            end
        end
    end
end
