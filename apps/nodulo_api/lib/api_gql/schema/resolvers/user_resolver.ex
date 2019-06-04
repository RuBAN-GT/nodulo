defmodule Nodulo.ApiGql.Schema.UserResolver do

  alias Nodulo.Bellas.User.Context

  def list_users(_parent, _args, _resolution) do
    {:ok, Context.get_users()}
  end
  def get_user(_parent, %{id: id}, _resolution) do
    {:ok, Context.get_user(id)}
  end

  def get_user(_parent, _args, _resolution) do
    {:ok, Nodulo.Bellas.Factory.params_for(:user)}
  end
end
