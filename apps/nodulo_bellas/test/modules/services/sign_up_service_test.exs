defmodule Nodulo.Bellas.SignUpServiceTest do
  use ExUnit.Case
  use Quixir

  alias Nodulo.Bellas.{Factory, SignUpService, User}
  alias Nodulo.Bellas.User.Context

  setup do
    Context.purge_users()
    :ok
  end

  describe "SignUpService.call/1" do
    test "registering a valid user" do
      ptest [], repeat_for: 5 do
        sample =
          Factory.params_for(:user)
          |> SignUpService.call()

        assert {:ok, %User{id: id}} = sample
        assert %User{} = Context.get_user(id)
      end
    end
  end
end
