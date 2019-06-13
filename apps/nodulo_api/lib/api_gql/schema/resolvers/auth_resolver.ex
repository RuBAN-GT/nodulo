defmodule Nodulo.ApiGql.Schema.AuthResolver do
  @moduledoc false

  alias Nodulo.ApiGql.{SignInService, SignUpService}
  import Nodulo.ApiGql.Schema.AuthType.UserSecrets, only: [from_token: 1]

  def sign_in(_parent, %{credentials: params}, _resolution) do
    {:ok, from_token(SignInService.call(params))}
  end

  def sign_up(_parent, %{params: params}, _resolution) do
    {:ok, from_token(SignUpService.call(params))}
  end
end
