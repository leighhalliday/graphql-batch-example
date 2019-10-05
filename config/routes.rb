Rails.application.routes.draw do
  # let the good times roll
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  post "/graphql", to: "graphql#execute"
end
