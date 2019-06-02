defmodule Nodulo.Bellas.SignUpService do
  @moduledoc """
  Service for user registration in Bellas component
  """

  alias Nodulo.Bellas.User.Context
  alias Nodulo.Bellas.SignUpService.UserChangeset

  @spec call(map() | struct()) :: Context.modification()
  def call(user_params) do
    user_params
    |> UserChangeset.sign_up_changeset()
    |> Context.create_user()
  end
end
