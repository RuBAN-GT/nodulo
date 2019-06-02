defmodule Nodulo.Elisen.DbWorker do
  @moduledoc """
  Worker for starting a mnesia
  """

  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(state) do
    {setup(), state}
  end

  defp setup do
    Memento.start |> handle_setup
  end

  defp handle_setup(:ok), do: :ok
  defp handle_setup({:error, {:already_started, _}}), do: :ok
  defp handle_setup(_), do: :stop
end
