# frozen_string_literal: true

module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false do
      description "This is the post's id"
    end

    field :title, String do
      description "This is the post's title"
    end

    field :body, String do
      description "This is the post's body, the main content of the post"
    end

    field :user_id, Integer, null: false do
      description "This is the post's user id"
    end

    field :user, UserType do
      description "This is the user references"
    end
  end
end
