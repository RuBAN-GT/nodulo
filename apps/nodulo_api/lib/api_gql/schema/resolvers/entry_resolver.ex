defmodule Nodulo.ApiGql.Schema.EntryResolver do
  @moduledoc false

  def list_entries(_parent, _args, _resolution) do
    {:ok, Nodulo.Elisen.Factory.build_list(5, :entry)}
  end

  def get_entry(_parent, %{id: id}, _resolution) do
    {:ok, Nodulo.Elisen.Factory.build(:entry, %{id: id})}
  end
end
