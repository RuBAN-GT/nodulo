defmodule Nodulo.Bellas.Repo.Migrations.CreateUserSettings do
  use Ecto.Migration

  def change do
    create table(:user_settings) do
      add :user_id, references(:users)

      add :name, :string
      add :value, :string
    end

    create unique_index(:user_settings, [:user_id, :name])
  end
end
