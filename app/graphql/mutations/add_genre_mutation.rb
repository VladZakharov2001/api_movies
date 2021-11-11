module Mutations
    class AddGenreMutation < BaseMutation
        argument :favorite_genre, ID, required: true
        field :errors,[String], null: false
        def resolve(favorite_genre:)
            user = context[:current_user]
            genre = Genre.where(external_genre_id:favorite_genre).first_or_initialize

            if genre.save
                user.genres << genre unless user.genres.exists?(genre.id)
                {
                    errors:[]
                }
            else
                { errors: genre.errors.full_messages }
            end
        end
    end 
end
