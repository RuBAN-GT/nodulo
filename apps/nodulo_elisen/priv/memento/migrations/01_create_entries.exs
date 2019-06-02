defmodule Nodulo.Elisen.Migrations.CreateEntries do
  @behaviour MementoMigrator.Migration

  alias Nodulo.Elisen.Data.Entry

  def up(nodes) do
    Memento.Table.create Entry, disc_copies: nodes
  end

  def down() do
    Memento.Table.delete Entry
  end
end
