defmodule Nodulo.Bellas.FunctionGenerator do
  @moduledoc false

  @behaviour Pollution.Generator

  alias Pollution.State

  @state %State {
    type: __MODULE__,
    last_value: nil
  }

  def create([generator: generator]) do
    %State{ @state | distribution: generator }
  end

  def filters, do: %{}

  def next_value(state, _locals) do
    next_value = state.distribution.(state.last_value)
    { next_value, state }
  end

  def update_constraints(state), do: state

  def params_for_shrink(_, current) do
    %Pollution.Shrinker.Params{
      current: current,
      done:    true,
      shrink:  fn (sp) -> sp end
    }
  end
end
