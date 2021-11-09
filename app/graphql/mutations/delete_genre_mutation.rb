module Mutations
    class DeleteGenreMutation < BaseMutation
        argument :genre, Integer, required: true
        field :errors,[String], null: false
        def resolve(genre:)
            user = context[:current_user]
            genre = Genre.where(external_genre_id:genre)
            usergenre = UserGenre.where(user_id:user.id, genre_id:genre[0].id)
            UserGenre.delete(usergenre)
            {
                errors:[]
            }
        end
    end
end
