module Mutations
    class AddIsWatchedMutation < BaseMutation
        argument :id, ID, required: true
        field :errors,[String], null: false
        def resolve(id:)
            user = context[:current_user]
            film = user.favorite_user_films.find(id) 
            film.is_watched = !film.is_watched
            if(film.save)
            {
                errors:[]
            }
            else{
                errors: film.full_messages
            }
            end
        end
    end 
end