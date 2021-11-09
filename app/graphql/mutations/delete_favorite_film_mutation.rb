module Mutations
    class DeleteFavoriteFilmMutation < BaseMutation
        argument :film, Integer, required: true
        field :errors,[String], null: false
        def resolve(film:)
            user = context[:current_user]
            film = SaveFilm.where(external_film_id:film)
            userfilm = UserSaveFilm.where(user_id:user.id, save_film_id:film[0].id)
            UserSaveFilm.delete(userfilm)
            {
                errors:[]
            }
        end
    end
end
