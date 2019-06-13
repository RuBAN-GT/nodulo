defmodule Nodulo.Bellas.SignUpService.UserChangesetTest do
  use ExUnit.Case
  use Quixir

  alias Ecto.Changeset
  alias Nodulo.Bellas.{Factory, PasswordHelper}
  alias Nodulo.Bellas.FunctionGenerator, as: FG

  import Nodulo.Bellas.SignUpService.UserChangeset,
    only: [sign_up_changeset: 1]

  def generate_password(_) do
    FakerElixir.Lorem.word()
  end

  describe "UserChangeset.sign_up_changeset/1" do
    test "returns valid changeset for valid input" do
      ptest [], repeat_for: 10 do
        changeset =
          Factory.params_for(:user)
          |> sign_up_changeset()

        assert changeset.valid?
      end
    end

    test "returns changeset with encrypted_password field" do
      ptest [password: FG.create(generator: &generate_password/1)], repeat_for: 10 do
        encrypted_password =
          Factory.params_for(:user, %{password: password})
          |> sign_up_changeset()
          |> Changeset.get_change(:encrypted_password)

        assert PasswordHelper.is_correct_password?(password, encrypted_password)
      end
    end
  end
end
