module Types
  class MutationType < Types::BaseObject
    field :create_category, mutation: Mutations::CreateCategory
    field :create_event, mutation: Mutations::CreateEvent
  end
end
