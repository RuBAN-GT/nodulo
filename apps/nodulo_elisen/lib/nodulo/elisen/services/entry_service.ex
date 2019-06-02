defmodule Nodulo.Elisen.EntryService do
  @moduledoc """
  Module for making common operations with entries
  """

  alias Nodulo.Elisen.Data.{Entry, EntryConverter, NewEntryInput}

  @spec get_entries :: list(Entry.t())
  def get_entries do
    Memento.transaction!(fn ->
      Memento.Query.all(Entry)
    end)
  end

  @spec get_entry(number) :: Entry.t()
  def get_entry(id) do
    Memento.transaction!(fn ->
      Memento.Query.read(Entry, id)
    end)
  end

  @spec create_entry(NewEntryInput.t()) :: Entry.t()
  def create_entry(attributes) do
    Memento.transaction!(fn ->
      attributes |> EntryConverter.new_entry_input_to_entry() |> Memento.Query.write()
    end)
  end

  @spec destroy_entry(number) :: atom
  def destroy_entry(id) do
    Memento.transaction!(fn ->
      Memento.Query.delete(Entry, id)
    end)
  end
end
