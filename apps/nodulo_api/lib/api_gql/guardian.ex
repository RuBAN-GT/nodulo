defmodule Nodulo.ApiGql.Guardian do
  @moduledoc """
  Module for user authentication & authorization
  """

  use Guardian, otp_app: :nodulo_api

  alias Nodulo.Bellas.User.Context

  @doc """
  Internal function for extraction a user id
  """
  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  @doc """
  Internal function for extraction useful payload with content from claims
  """
  def resource_from_claims(claims) do
    resource =
      claims["sub"]
      |> Context.get_user!()

    {:ok, resource}
  end
end
