defmodule Nodulo.ApiWeb.Schema.AuthType do
  use Absinthe.Schema.Notation

  alias Nodulo.ApiWeb.Schema.UserResolver

  @desc "Current user with related secrets"
  object :auth_data do
    field :secret, non_null(:string)
    field :user, non_null(:user)
  end

  @desc "Parameters required for sign up"
  input_object :sign_up_params do
    field :email, non_null(:string)
    field :name, non_null(:string)
    field :password, non_null(:string)
    field :password_confirmation, non_null(:string)
  end

  @desc "User secrets required for sign in"
  input_object :user_credentials do
    field :email, non_null(:string)
    field :password, non_null(:string)
  end

  object :auth_mutations do
    @desc "Sign in operation"
    field :sign_in, non_null(:auth_data) do
      arg :credentials, non_null(:user_credentials)
      resolve &UserResolver.get_user/3
    end

    @desc "Sign up operation"
    field :sign_up, non_null(:current_user) do
      arg :params, non_null(:sign_up_params)
      resolve &UserResolver.get_user/3
    end
  end
end
