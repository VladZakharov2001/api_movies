module Mutations
    class AddGenreMutation < BaseMutation
        argument :genre, ID, required: true
        field :errors,[String], null: false
        def resolve(genre:)
            user = context[:current_user]
            genre = Genre.where(external_genre_id:genre).first_or_initialize

            if(!(UserGenre.where(user_id:user.id,genre_id:genre.id).any?))
                user.genres << genre
                {
                    errors:[]
                }
            end
        end
    end 
end
