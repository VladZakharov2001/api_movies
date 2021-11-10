module Mutations
    class DeleteFavoriteFilmMutation < BaseMutation
        argument :id, Integer, required: true
        field :errors,[String], null: false
        def resolve(id:)
            user = context[:current_user]
            film = user.favorite_user_films.find(id).destroy
            if(film)
            {
                errors:[]
            }
            else{
                errors: film.errors.full_messages
            }
            end
        end
    end
end
