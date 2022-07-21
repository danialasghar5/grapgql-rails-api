module Mutations
  class CreatePostMutation < BaseMutation
    field :post, Types::PostType, null: false

    argument :title, String, required: true do
      description "Title field is String type and is required for a new post to be created"
    end

    argument :body, String, required: true do
      description "Body field is String type and is required for a new post to be created"
    end

    argument :user, Integer, required: true do
      description "This is id of the post's user"
    end

    def resolve(title:, body:, user:)
      @post = Post.new(title: title, body: body, user: User.find_by_id(user))

      if @post.save
        {
          post: @post,
          errors: []
        }
      else
        {
          post: nil,
          errors: @post.errors.full_messages
        }
      end
    end
  end
end
