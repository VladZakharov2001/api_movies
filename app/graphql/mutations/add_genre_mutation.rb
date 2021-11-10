module Mutations
    class AddGenreMutation < BaseMutation
        argument :genre, ID, required: true
        field :errors,[String], null: false
        def resolve(genre:)
            user = context[:current_user]
            genre = user.genres << Genre.create(external_genre_id:genre)
            if(genre)
            {
                errors:[]
            }
            else
            {
                errors:genre.errors.full_messages
            }
            end
        end
    end 
end
