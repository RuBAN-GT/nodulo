defmodule Nodulo.ApiWeb.Schema do
  @moduledoc """
  The GraphQL scheme for Absinthe
  """

  use Absinthe.Schema

  import_types Nodulo.ApiWeb.Schema.AuthType
  import_types Nodulo.ApiWeb.Schema.EntryType
  import_types Nodulo.ApiWeb.Schema.UserType

  query do
    import_fields :entry_queries
    import_fields :user_queries
  end

  mutation do
    import_fields :auth_mutations
    import_fields :entry_mutations
  end
end
