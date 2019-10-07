# OneEleven Dev Peer Group

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

Defines the contract of the GraphQL API.

- Root types (query, mutation, subscription)
- Scalar types
- Custom types
- Nullable
- Input types
- Lists / Unions

## Resolvers (Sean)

- We need to generate schema (either manually, or via code in Ruby)
- Resolver resolve (produce data for) one field and level at time
- Resolvers has 3 pieces of data available to it:
  - Object
  - Arguments
  - Context

## React, Apollo & GraphQL (Sean)

Create your Apollo client... make it available via context
Define Query
Perform query using useQuery hook

## Mutations (Leigh)

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

- Batching queries
- Complexity
- Depth

## Other Topics

- Authorization
- Pagination
