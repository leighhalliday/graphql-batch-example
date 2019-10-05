# Efficient GraphQL queries in Rails

## Queries

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

Query all categories and their first 5 events:

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

## Mutations

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

## Performance

- Batching queries
- Complexity
- Depth

## Authorization

Context...
