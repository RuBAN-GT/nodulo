defmodule Nodulo.ApiGql.Schema do
  @moduledoc """
  The GraphQL scheme for Absinthe
  """

  use Absinthe.Schema

  import_types Nodulo.ApiGql.Schema.AuthType
  import_types Nodulo.ApiGql.Schema.EntryType
  import_types Nodulo.ApiGql.Schema.UserType

  query do
    import_fields :entry_queries
    import_fields :user_queries
  end

  mutation do
    import_fields :auth_mutations
    import_fields :entry_mutations
  end
end
