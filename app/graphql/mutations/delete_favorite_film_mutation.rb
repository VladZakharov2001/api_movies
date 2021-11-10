module Mutations
    class DeleteFavoriteFilmMutation < BaseMutation
        argument :film, Integer, required: true
        field :errors,[String], null: false
        def resolve(film:)
            user = context[:current_user]
            film = FavoriteFilm.where(external_film_id:film)
            userfilm = FavoriteUserFilm.where(user_id:user.id, favorite_film_id:film[0].id)
            FavoriteUserFilm.delete(userfilm)
            {
                errors:[]
            }
        end
    end
end
