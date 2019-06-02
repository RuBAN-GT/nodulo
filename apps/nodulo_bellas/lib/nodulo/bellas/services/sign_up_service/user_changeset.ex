defmodule Nodulo.Bellas.SignUpService.UserChangeset do
  @moduledoc """
  Generates changeset with required data for sign up
  """

  alias Ecto.Changeset
  alias Nodulo.Bellas.User
  alias Nodulo.Bellas.User.{Generator, Validator}

  @required_fields [:email, :name, :password, :password_confirmation]

  @spec sign_up_changeset(map() | struct()) :: User.changeset()
  def sign_up_changeset(params) do
    %User{}
    |> Changeset.cast(params, @required_fields)
    |> Changeset.validate_required(@required_fields)
    |> Validator.check_password_pair()
    |> Generator.put_encrypt_password()
  end
end
