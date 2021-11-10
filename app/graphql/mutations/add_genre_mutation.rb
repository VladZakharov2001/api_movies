module Mutations
    class AddGenreMutation < BaseMutation
        argument :genre, ID, required: true
        field :errors,[String], null: false
        def resolve(genre:)
            user = context[:current_user]
            genre = user.genres << Genre.where(external_genre_id:genre).first_or_initialize
            { errors: genre ? [] : genre.errors.full_messages }
        end
    end 
end
