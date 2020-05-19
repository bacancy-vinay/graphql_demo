# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # /users
    field :users, [Types::UserType], null: false
    # field :posts, [Types::PostType], null: false
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def users
      User.all
    end

    def user(id:)
      User.find(id)
    end
  end
end
