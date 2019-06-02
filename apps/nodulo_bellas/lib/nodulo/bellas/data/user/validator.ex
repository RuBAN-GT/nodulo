defmodule Nodulo.Bellas.User.Validator do
  @moduledoc """
  Functions for checking User fields
  """

  alias Ecto.Changeset
  alias Nodulo.Bellas.User

  @doc """
  Compares incoming passwords for change
  """
  @spec check_password_pair(User.changeset()) :: User.changeset()
  def check_password_pair(changeset) do
    password = Changeset.get_change(changeset, :password)
    password_confirmation = Changeset.get_change(changeset, :password_confirmation)

    if password == password_confirmation do
      changeset
    else
      Changeset.add_error(
        changeset,
        :password_confirmation,
        "password_confirmation does not match password!"
      )
    end
  end
end
