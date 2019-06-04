defmodule Nodulo.ApiWeb.Schema.AuthType do
  use Absinthe.Schema.Notation

  alias Nodulo.ApiWeb.Schema.AuthResolver

  @desc "Secret data for successfuly user authentication"
  object :user_secrets do
    field :secret, non_null(:string)
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
    field :sign_in, non_null(:user_secrets) do
      arg :credentials, non_null(:user_credentials)
      resolve &AuthResolver.sign_in/3
    end

    @desc "Sign up operation"
    field :sign_up, non_null(:user_secrets) do
      arg :params, non_null(:sign_up_params)
      resolve &AuthResolver.sign_up/3
    end
  end
end
