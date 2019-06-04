defmodule Nodulo.ApiGql.SignUpService do
  alias Nodulo.ApiGql.UserSecretService
  alias Nodulo.Bellas.SignUpService, as: InternalSignUp

  @type result_type :: String.t()

  @spec call(map | struct) :: result_type()
  def call(params) do
    params |> InternalSignUp.call() |> handle_modification()
  end

  defp handle_modification({:ok, changeset}) do
    changeset |> UserSecretService.call()
  end
end
