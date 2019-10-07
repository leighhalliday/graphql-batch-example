module Types
  class QueryType < Types::BaseObject
    field :events, [Types::EventType], null: false, description: "All the events"

    def events
      Event.all
    end

    field :event, Types::EventType, null: true, description: "A single event" do
      argument :id, ID, required: true
    end

    def event(id:)
      Event.find(id)
    end

    field :categories, [Types::CategoryType], null: false, description: "All the categories"

    def categories
      Category.all
    end

    field :category, Types::CategoryType, null: true, description: "A single category" do
      argument :id, ID, required: true
    end

    def category(id:)
      Category.find(id)
    end
  end
end
