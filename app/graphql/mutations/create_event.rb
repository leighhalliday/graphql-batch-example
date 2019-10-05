class Mutations::CreateEvent < Mutations::BaseMutation
  null true

  argument :name, String, required: true
  argument :category_id, ID, required: true
  argument :start_time, String, required: true
  argument :end_time, String, required: true

  field :event, Types::EventType, null: true
  field :errors, [String], null: false

  def resolve(name:, category_id:, start_time:, end_time:)
    category = Category.find(category_id)

    event = category.events.build(
      name: name,
      start_time: start_time,
      end_time: end_time
    )

    if event.save
      {
        event: event,
        errors: [],
      }
    else
      {
        event: nil,
        errors: event.errors.full_messages
      }
    end
  end
end