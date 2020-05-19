# frozen_string_literal: true

module Mutations
  class CreateUser < GraphQL::Schema::RelayClassicMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :age, Integer, required: true

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(name:, email:, age:)
      user = User.new(name: name, email: email, age: age)
      if user.save
        {
          user: user,
          errors: []
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
