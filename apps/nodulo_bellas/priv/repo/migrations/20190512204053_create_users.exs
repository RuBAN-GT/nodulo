defmodule Nodulo.Bellas.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      timestamps(inserted_at: :created_at)

      add :email, :string
      add :name, :string
      add :encrypted_password, :string
    end
  end
end
