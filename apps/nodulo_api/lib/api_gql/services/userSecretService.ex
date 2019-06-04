defmodule Nodulo.ApiGql.UserSecretService do
  @moduledoc """
  Service for generating secrets for selected user
  """

  alias Nodulo.ApiGql.Guardian
  alias Nodulo.Bellas.User

  @type secrets :: String.t()

  @doc """
  Generates secrets for input
  """
  @spec call(User.t()) :: secrets()
  def call(user) do
    user |> Guardian.encode_and_sign() |> handle_result
  end

  defp handle_result({:ok, token, _claims}) do
    token
  end
end
