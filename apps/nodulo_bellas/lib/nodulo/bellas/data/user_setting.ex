defmodule Nodulo.Bellas.UserSetting do
  use Ecto.Schema

  schema "user_settings" do
    field :name, :string
    field :value, :string

    belongs_to :user, Nodulo.Bellas.User
  end
end
