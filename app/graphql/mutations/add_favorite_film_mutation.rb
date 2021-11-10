module Mutations
    class AddFavoriteFilmMutation < BaseMutation
        argument :favorite_film, ID, required: true
        field :errors,[String], null: false
        def resolve(favorite_film:)
            user = context[:current_user]
            filmin = FavoriteFilm.where(external_film_id:favorite_film).first_or_initialize

            if filmin.save
                user.favorite_films << filmin unless user.favorite_films.exists?(filmin.id)
                {
                    errors:[]
                }
            else
                { errors: filmin.errors.full_messages }
            end
        end
    end
end
