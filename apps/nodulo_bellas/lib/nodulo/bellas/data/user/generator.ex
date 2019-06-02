defmodule Nodulo.Bellas.User.Generator do
  @moduledoc """
  Functions for generating User fields
  """

  alias Ecto.Changeset
  alias Nodulo.Bellas.{PasswordHelper, User}

  @doc """
  Encrypts containing passwords and puts into internal fields
  """
  @spec put_encrypt_password(User.changeset()) :: User.changeset()
  def put_encrypt_password(%Changeset{valid?: true} = changeset) do
    encrypt_password =
      Changeset.get_change(changeset, :password)
      |> PasswordHelper.encrypt_password()

    Changeset.put_change(
      changeset,
      :encrypted_password,
      encrypt_password
    )
  end

  def put_encrypt_password(changeset), do: changeset
end
