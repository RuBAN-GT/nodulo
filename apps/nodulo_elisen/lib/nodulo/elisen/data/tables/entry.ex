defmodule Nodulo.Elisen.Data.Entry do
  use Memento.Table,
      attributes: [:id, :user_id, :created_at, :updated_at, :properties],
      index: [:user_id],
      type: :ordered_set,
      autoincrement: true

  @type t :: %Nodulo.Elisen.Data.Entry{}
end
