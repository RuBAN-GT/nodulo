defmodule Nodulo.ApiGql.SignInService do
  @moduledoc """
  Sign in service in API component
  """

  alias Nodulo.ApiGql.UserSecretService
  alias Nodulo.Bellas.SignInService.Credentials
  alias Nodulo.Bellas.SignInService, as: InternalSignIn

  @type result_type :: String.t()

  @spec call(map | struct) :: result_type()
  def call(params) do
    struct(Credentials, params)
    |> InternalSignIn.call()
    |> handle_response()
  end

  defp handle_response({:ok, user}) do
    user |> UserSecretService.call()
  end
end
