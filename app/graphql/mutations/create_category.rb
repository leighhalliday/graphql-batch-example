class Mutations::CreateCategory < Mutations::BaseMutation
  null true

  argument :name, String, required: true
  argument :slug, ID, required: true

  field :category, Types::CategoryType, null: true
  field :errors, [String], null: false

  def resolve(name:, slug:)
    category = Category.new(
      name: name,
      slug: slug
    )

    if category.save
      {
        category: category,
        errors: [],
      }
    else
      {
        category: nil,
        errors: category.errors.full_messages
      }
    end
  end
end