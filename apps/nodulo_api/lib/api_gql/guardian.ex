defmodule Nodulo.ApiGql.Guardian do

  use Guardian, otp_app: :nodulo_api

  alias Nodulo.Bellas.User.Context

  def subject_for_token(resource, _claims) do
    sub = to_string(resource.id)
    {:ok, sub}
  end

  def resource_from_claims(claims) do
    resource =
      claims["sub"]
      |> Context.get_user!()

    {:ok, resource}
  end
end
