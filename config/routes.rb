Rails.application.routes.draw do
  # mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
  # post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "movies/:id", to: "films#show"
  get "savefilms", to: "save_films#index"
  post "savefilms", to: "save_films#create"
end
