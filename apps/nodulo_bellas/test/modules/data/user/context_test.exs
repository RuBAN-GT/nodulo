defmodule Nodulo.Bellas.User.ContextTest do
  use ExUnit.Case
  use Quixir

  alias Nodulo.Bellas.{Factory, User}
  alias Nodulo.Bellas.User.Context

  setup do
    Context.purge_users()
    :ok
  end

  describe "Nodulo.Bellas.Context.get_users/0" do
    test "returning user list" do
      ptest [collection_size: int(min: 0, max: 100)], repeat_for: 10 do
        Context.purge_users()

        Factory.insert_list(collection_size, :user)
        collection = Context.get_users()

        assert length(collection) == collection_size
        assert Enum.all?(collection, &match?(%{__struct__: User}, &1))
      end
    end
  end

  describe "Nodulo.Bellas.Context.get_user/1" do
    test "getting existed user" do
      ptest [], repeat_for: 10 do
        %User{id: id} = Factory.insert(:user)
        sample = Context.get_user(id)

        assert %User{id: ^id} = sample
      end
    end

    test "getting nil for non-existed user" do
      ptest [id: int(min: 0)], repeat_for: 10 do
        sample = Context.get_user(id)
        assert sample == nil
      end
    end
  end

  describe "Nodulo.Bellas.Context.get_user!/1" do
    test "getting existed user" do
      ptest [], repeat_for: 10 do
        %User{id: id} = Factory.insert(:user)
        sample = Context.get_user!(id)

        assert %User{id: ^id} = sample
      end
    end

    test "raise Ecto.NoResultsError for non-existed user" do
      ptest [id: int(min: 0)], repeat_for: 10 do
        assert_raise Ecto.NoResultsError, fn ->
          Context.get_user!(id)
        end
      end
    end
  end

  describe "Nodulo.Bellas.Context.create_user/1" do
    test "creating a new user" do
      result =
        Factory.build(:user)
        |> Context.create_user()

      assert {:ok, %User{id: _}} = result
    end
  end
end
