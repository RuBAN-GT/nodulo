defmodule Nodulo.Bellas.User.Context do
  @moduledoc """
  Common operations over User entity
  """

  alias Nodulo.Bellas.{Repo, User}

  @type modification :: {:ok | :error, User.changeset()}

  @doc """
  Get collection with user entities
  """
  @spec get_users() :: list(User.t())
  def get_users do
    User |> Repo.all()
  end

  @doc """
  Find user by id
  """
  @spec get_user(pos_integer) :: User.t()
  def get_user(id) do
    User |> Repo.get(id)
  end

  @spec get_user_by(Keyword.t() | map()) :: User.t()
  def get_user_by(clauses) do
    User |> Repo.get_by(clauses)
  end

  @doc """
  Strict finding user by id
  """
  @spec get_user!(pos_integer) :: User.t()
  def get_user!(id) do
    User |> Repo.get!(id)
  end

  @spec create_user(User.t() | User.changeset()) :: modification()
  def create_user(user) do
    user |> Repo.insert()
  end

  @doc """
  Delete all existed users
  """
  @spec purge_users :: any
  def purge_users do
    User |> Repo.delete_all()
  end
end
