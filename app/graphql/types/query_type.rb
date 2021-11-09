module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    # TODO: remove me
    field :me, Types::UserType, null: true
    field :user_save_films, [Types::UserSaveFilmType], null:false
    field :user_genres, [Types::UserGenreType], null:false
    field :all_genres, String, null:false 

    field :all_films, String, null:false do
      argument :year, Int, required:true
      argument :range, Int, required:true
      argument :genresId, GraphQL::Types::JSON, required:true
    end
  
    field :infofilm, String ,null:false do
      argument :id, Integer, required:true
    end

    def me
      context[:current_user]
    end

    # private 
    def user_genres
      user = context[:current_user]
      UserGenre.where(user_id: user.id)
    end 

    def user_save_films
      user = context[:current_user]
      UserSaveFilm.where(user_id: user.id)
    end

    def all_genres
       GetData.info_genres
    end

    def all_films(year:,range:,genresId:)
      GetData.info_films(year,range,genresId)
    end

    def infofilm(id:)
      GetData.info_film_by_id(id)
    end
  end 
end
