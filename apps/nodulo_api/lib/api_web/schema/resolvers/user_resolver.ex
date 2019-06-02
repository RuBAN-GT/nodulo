defmodule Nodulo.ApiWeb.Schema.UserResolver do

  def list_users(_parent, _args, _resolution) do
    {:ok, Nodulo.Bellas.Factory.build_list(5, :user)}
  end

  def get_user(_parent, %{id: id}, _resolution) do
    {:ok, Nodulo.Bellas.Factory.build(:user, %{id: id})}
  end

  def get_user(_parent, _args, _resolution) do
    {:ok, Nodulo.Bellas.Factory.build(:user)}
  end
end
