defmodule Nodulo.ApiGql.Schema.CommonResolver do

  def empty_list(_parent, _args, _resolution) do
    {:ok, []}
  end

  def empty_item(_parent, _args, _resolution) do
    {:ok, %{}}
  end
end
