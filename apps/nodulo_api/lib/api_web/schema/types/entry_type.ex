defmodule Nodulo.ApiWeb.Schema.EntryType do
  use Absinthe.Schema.Notation
  import_types Absinthe.Plug.Types

  alias Nodulo.ApiWeb.Schema.{EntryResolver}

  @desc "A book property"
  object :entry_property do
    field :key, non_null(:string)
    field :value, :string
  end

  @desc "A book entry"
  object :entry do
    field :id, non_null(:id)
    field :user_id, :id
    field :created_at, non_null(:string)
    field :updated_at, non_null(:string)
    field :properties, list_of(:entry_property)
  end

  @desc "A structure for entry creation"
  input_object :new_entry do
    field :media, non_null(:upload)
  end

  object :entry_queries do
    @desc "Get entry list"
    field :entries, list_of(:entry) do
      resolve &EntryResolver.list_entries/3
    end

    @desc "Get selected entry"
    field :entry, non_null(:entry) do
      arg :id, non_null(:id)
      resolve &EntryResolver.get_entry/3
    end
  end

  object :entry_mutations do
    @desc "Create a new entry"
    field :create_entry, non_null(:entry) do
      arg :entry, non_null(:new_entry)
      resolve &EntryResolver.get_entry/3
    end

    @desc "Create entries"
    field :create_entries, list_of(:entry) do
      arg :entris, non_null(list_of(:new_entry))
      resolve &EntryResolver.list_entries/3
    end

    @desc "Remove selected entry"
    field :remove_entry, :id do
      arg :id, non_null(:id)
      resolve &EntryResolver.get_entry/3
    end

    @desc "Remove list of entries"
    field :remove_entries, list_of(:id) do
      arg :ids, non_null(list_of(:id))
      resolve &EntryResolver.list_entries/3
    end
  end
end
