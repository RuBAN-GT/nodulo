defmodule Nodulo.ApiGql.Schema.UserType do
  @moduledoc false

  use Absinthe.Schema.Notation

  alias Nodulo.ApiGql.Schema.UserResolver

  @desc "A common user definition"
  interface :basic_user do
    field :id, non_null(:id)
    field :created_at, non_null(:string)
    field :updated_at, non_null(:string)
    field :email, non_null(:string)
    field :name, :string
  end

  @desc "A user configuration"
  object :user_setting do
    field :name, non_null(:string)
    field :value, :string
  end

  @desc "A system user information"
  object :user do
    interface :basic_user
    is_type_of :user

    field :id, non_null(:id)
    field :created_at, non_null(:string)
    field :updated_at, non_null(:string)
    field :email, non_null(:string)
    field :name, :string
  end

  @desc "An information about current user"
  object :current_user do
    interface :basic_user
    is_type_of :current_user
    import_fields :user

    field :settings, list_of(:user_setting)
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
end
