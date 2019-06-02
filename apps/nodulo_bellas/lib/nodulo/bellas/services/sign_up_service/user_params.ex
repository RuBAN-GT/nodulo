defmodule Nodulo.Bellas.SignUpService.UserParams do
  @moduledoc """
  Specification for sign up input with user params
  """

  defstruct [:email, :name, :password]

  @type t :: %__MODULE__{
          email: String.t(),
          name: String.t(),
          password: String.t()
        }
end
