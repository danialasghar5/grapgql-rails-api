module Mutations
  class CreateUserMutation < BaseMutation
    field :user, Types::UserType, null: false

    argument :name, String, required: true do
      description "This is name field and is required for a new user to be created"
    end

    def resolve(name:)
      @user = User.create(name: name)

      if @user.save
        {
          user: @user,
          errors: []
        }
      else
        {
          user: nil,
          errors: @user.errors.full_messages
        }
      end
    end
  end
end
