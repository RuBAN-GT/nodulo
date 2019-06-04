defmodule Nodulo.ApiGql.Schema.AuthType.UserSecrets do
  @enforce_keys [:secret]
  defstruct [:secret]

  @type t :: %__MODULE__{
          secret: String.t()
        }

  @spec from_token(String.t()) :: t()
  def from_token(token) do
    %__MODULE__{
      secret: token
    }
  end
end
