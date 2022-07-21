module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :posts, [Types::PostType], null: false do
      description "Query that selects all posts"
    end

    field :users, [Types::UserType], null: false do
      description "Query that selects all users"
    end

    field :posts_count, Integer, null: false do
      description "Query that selects post's count"
    end

    field :user, UserType, null: false do
      description "Query that selects a specific user by its id"
      argument :id, Integer, required: true
    end

    def posts
      Post.all
    end

    def users
      User.all
    end

    def user(id:)
      User.find_by_id(id)
    end

    def posts_count
      Post.count
    end
  end
end
