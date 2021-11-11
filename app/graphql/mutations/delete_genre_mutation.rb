module Mutations
    class DeleteGenreMutation < BaseMutation
        argument :id, Integer, required: true
        field :errors,[String], null: false
        def resolve(id:)
            user = context[:current_user]
            genre = user.user_genres.find(id).destroy
            { errors: genre ? [] : genre.errors.full_messages }
        end
    end
end
