defmodule Nodulo.Bellas.SignInService do
  @moduledoc """
  Service for verification user credentials
  """

  alias Nodulo.Bellas.{PasswordHelper, User}
  alias Nodulo.Bellas.User.Context
  alias Nodulo.Bellas.SignInService.Credentials

  @doc """
  Check user credentails and returned target user if all is right
  """
  @spec call(Credentials.t()) :: {:ok, User.t()} | {:error, nil}
  def call(%Credentials{email: email} = credentials) do
    [email: email]
    |> Context.get_user_by()
    |> verify_user(credentials)
  end

  defp verify_user(nil, _), do: fail_response()
  defp verify_user(user, credentials), do: verify_secrets(user, credentials)

  defp verify_secrets(%User{encrypted_password: original} = user, %{password: sample}) do
    if PasswordHelper.is_correct_password?(sample, original) do
      success_response(user)
    else
      fail_response()
    end
  end

  defp success_response(user), do: {:ok, user}
  defp fail_response(), do: {:error, nil}
end
