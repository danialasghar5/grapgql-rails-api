# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false do
      description "This is user id"
    end

    field :name, String do
      description "This is user name"
    end

    field :posts, [PostType] do
      description "This is user's posts"
    end
  end
end
