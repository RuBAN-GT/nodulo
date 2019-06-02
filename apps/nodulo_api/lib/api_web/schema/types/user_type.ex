defmodule Nodulo.ApiWeb.Schema.UserType do
  use Absinthe.Schema.Notation

  alias Nodulo.ApiWeb.Schema.{UserResolver}

  @desc "A user configuration"
  object :user_setting do
    field :name, non_null(:string)
    field :value, :string
  end

  @desc "A user information"
  object :user do
    field :id, non_null(:id)
    field :created_at, non_null(:string)
    field :updated_at, non_null(:string)
    field :email, non_null(:string)
    field :name, :string
  end

  @desc "An information about current user"
  object :current_user do
    import_fields :user
    field :settings, list_of(:user_setting)
  end

  @desc "An information for sign up"
  input_object :sign_up_user do
    field :email, non_null(:string)
    field :name, :string
  end

  object :user_queries do
    @desc "Get all users"
    field :users, list_of(:user) do
      resolve &UserResolver.list_users/3
    end

    @desc "Get selected user"
    field :user, non_null(:user) do
      arg :id, non_null(:id)
      resolve &UserResolver.get_user/3
    end

    @desc "Get a current user"
    field :me, non_null(:current_user) do
      resolve &UserResolver.get_user/3
    end
  end

  object :user_mutations do
    @desc "Sign in operation"
    field :sign_in, non_null(:current_user) do
      arg :email, non_null(:string)
      arg :password, non_null(:string)

      resolve &UserResolver.get_user/3
    end

    @desc "Sign up operation"
    field :sign_up, non_null(:current_user) do
      arg :user, non_null(:sign_up_user)
      resolve &UserResolver.get_user/3
    end
  end
end
