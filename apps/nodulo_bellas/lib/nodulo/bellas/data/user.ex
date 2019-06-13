defmodule Nodulo.Bellas.User do
  use Ecto.Schema

  alias Ecto.Changeset

  schema "users" do
    has_many(:settings, Nodulo.Bellas.UserSetting)

    timestamps(inserted_at: :created_at)

    field(:email, :string)
    field(:name, :string)

    field(:encrypted_password, :string)
    field(:password, :string, virtual: true)
  end

  @type changeset :: Changeset.t(__MODULE__.t())
end
