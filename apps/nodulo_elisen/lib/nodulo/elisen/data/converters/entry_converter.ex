defmodule Nodulo.Elisen.Data.EntryConverter do
  @moduledoc """
  Converter for casting special structs to entries
  """

  alias Nodulo.Elisen.Data.{Entry, NewEntryInput}

  @spec new_entry_input_to_entry(NewEntryInput.t()) :: Entry.t()
  def new_entry_input_to_entry(input) do
    input_map =
      Map.from_struct(input)
      |> Map.merge(defaults_new_entry_fields())

    struct(Entry, input_map)
  end

  defp defaults_new_entry_fields do
    {_, current_time} = DateTime.now("Etc/UTC")

    %{
      created_at: current_time,
      updated_at: current_time
    }
  end
end
