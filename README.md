# OneEleven Dev Peer Group

1. Query Basics
2. GraphQL Schema
3. Query Resolvers
4. Frontend GraphQL Basics
5. Mutations
6. Performance
7. Other Topics

## Further Resources

- https://graphql.org/
- https://www.howtographql.com/
- https://www.apollographql.com/
- https://graphql-ruby.org/
- Backend: https://github.com/leighhalliday/graphql-batch-example
- Graphiql: https://dev-peer-group-graphql.herokuapp.com/graphiql
- Frontend: https://github.com/leighhalliday/graphql-react-demo
- Demo: https://oneeleven-graphql-react.netlify.com/

## Queries (Leigh)

Query all the events and their categories:

```graphql
query {
  events {
    id
    name
    category {
      id
      name
    }
  }
}
```

The results:

```json
{
  "data": {
    "events": [
      {
        "id": "1",
        "name": "Leigh's Party",
        "category": {
          "id": "1",
          "name": "Party"
        }
      }
    ]
  }
}
```

Query all categories and their first 5 events... try changing the number 5 to a string "5" and see what happens.

```graphql
query {
  categories {
    id
    name
    events(first: 5) {
      id
      name
      startTime
    }
  }
}
```

The results:

```json
{
  "data": {
    "categories": [
      {
        "id": "1",
        "name": "Party",
        "events": [
          {
            "id": "1",
            "name": "Leigh's Party",
            "startTime": "2019-11-11 18:00:00 UTC"
          }
        ]
      },
      {
        "id": "2",
        "name": "Peer Group",
        "events": [
          {
            "id": "3",
            "name": "Dev Peer Group",
            "startTime": "2019-11-08 12:00:00 UTC"
          },
          {
            "id": "2",
            "name": "Dev Peer Group",
            "startTime": "2019-10-08 12:00:00 UTC"
          }
        ]
      }
    ]
  }
}
```

## Schema (Leigh)

Defines the contract of the GraphQL API. Acts as documentation. Schema can either be hand-written, or generated in code. In Ruby environment, typically schema will be generated by code.

More [details here](https://graphql.org/learn/schema/).

- Root types (query, mutation, subscription)
- Scalar types
- Custom Scalars
- Nullable and Nullable!
- Arguments
- Input types
- [Lists] / Unions

## Resolvers (Sean)

Resolvers are helper functions that assist the server to resolve queries and mutations. The GraphQL server traverses through this query to create the query response. Resolver resolve (produce data for) one field and level at time.

Details for Ruby [found here](https://graphql-ruby.org/fields/resolvers.html).

Resolvers have 3 pieces of data available to them:

- Object (Parent)
- Arguments (Field Level)
- Context (Global)

## React, Apollo & GraphQL (Sean)

Two Important Libraries:

1. [graphql-tag](https://github.com/apollographql/graphql-tag), parses the template literal string into GraphQL Abstract Syntax Tree
2. [apollo-client](https://github.com/apollographql/apollo-client), comes with lots of handy features when working with GraphQL (ex. automatic loading and error state tracking)

Steps to make a Query:

1. Create your Apollo client... make it available via context
2. Define Query
3. Perform query using useQuery hook

## Mutations (Leigh)

A query is similar to a GET request (reading data), but a mutation is similar to PUT, POST, DELETE requests... it is all about changing data.

Create a Category:

```graphql
mutation {
  createCategory(input: { name: "Party", slug: "party" }) {
    category {
      id
      name
    }
    errors
  }
}
```

Create an Event:

```graphql
mutation {
  createEvent(
    input: {
      name: "Leigh's Party"
      categoryId: "1"
      startTime: "2019-11-11 18:00:00"
      endTime: "2019-11-11 22:00:00"
    }
  ) {
    event {
      id
      name
    }
    errors
  }
}
```

## Performance (Leigh)

- Batching queries: Avoiding N+1
- Complexity
- Depth

## Other Topics (Leigh)

- Authorization - https://graphql-ruby.org/authorization/overview.html
- Pagination
- Subscriptions - https://graphql-ruby.org/subscriptions/overview.html
