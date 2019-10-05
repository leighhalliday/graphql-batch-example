class GraphqlBatchExampleSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)
  use(GraphQL::Batch)

  max_depth 5
  max_complexity 200
end
