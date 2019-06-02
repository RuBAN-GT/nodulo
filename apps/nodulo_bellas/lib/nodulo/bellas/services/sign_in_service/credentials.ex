defmodule Nodulo.Bellas.SignInService.Credentials do
  @moduledoc """
  Struct with required user credentials data
  """

  defstruct [:email, :password]

  @type t :: %__MODULE__{
          email: String.t(),
          password: String.t()
        }
end
