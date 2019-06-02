defmodule Nodulo.Elisen.Data.NewEntryInput do
  @moduledoc """
  Structure for handling creatable entries
  """

  defstruct [:user_id, :properties]

  @type t :: %Nodulo.Elisen.Data.NewEntryInput{
          user_id: pos_integer,
          properties: list(any)
        }
end
