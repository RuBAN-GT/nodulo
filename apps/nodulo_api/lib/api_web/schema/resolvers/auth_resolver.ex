defmodule Nodulo.ApiWeb.Schema.AuthResolver do
  alias Nodulo.ApiWeb.{SignInService, SignUpService}

  def sign_in(_parent, %{credentials: params}, _resolution) do
    {:ok, SignInService.call(params)}
  end

  def sign_up(_parent, %{params: params}, _resolution) do
    {:ok, SignUpService.call(params)}
  end
end
