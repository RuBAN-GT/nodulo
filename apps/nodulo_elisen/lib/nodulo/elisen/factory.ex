defmodule Nodulo.Elisen.Factory do
  use ExMachina

  alias Nodulo.Elisen.Data.{Entry}

  @spec entry_factory() :: Entry.t
  def entry_factory do
    %Entry{
      id: FakerElixir.Number.digits(),
      user_id: 1,
      created_at: FakerElixir.Date.backward(7),
      updated_at: FakerElixir.Date.backward(1),
      properties: []
    }
  end
end
