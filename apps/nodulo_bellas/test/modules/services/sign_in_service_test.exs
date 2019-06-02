defmodule Nodulo.Bellas.SignUpServiceTest do
  use ExUnit.Case
  use Quixir

  alias Nodulo.Bellas.{Factory, SignInService, SignUpService, User}
  alias Nodulo.Bellas.SignInService.Credentials
  alias Nodulo.Bellas.User.Context
  alias Nodulo.Bellas.FunctionGenerator, as: FG

  def generate_credentials(_) do
    password = FakerElixir.Lorem.word()
    attrs = %{password: password, password_confirmation: password}

    with {:ok, %User{email: email}} <-
           Factory.params_for(:user, attrs)
           |> SignUpService.call(),
         do: %Credentials{
           email: email,
           password: password
         }
  end

  setup do
    Context.purge_users()
    :ok
  end

  describe "SignInService.call/1" do
    test "sign in with valid credentials" do
      ptest [credentials: FG.create(generator: &generate_credentials/1)], repeat_for: 5 do
        %Credentials{email: email} = credentials
        assert {:ok, %User{email: ^email}} = SignInService.call(credentials)
      end
    end

    test "sign in with invalid credentails" do
      ptest [password: string(min: 1)], repeat_for: 5 do
        credentials = %Credentials{
          email: FakerElixir.Internet.email(),
          password: password
        }

        assert {:error, _} = SignInService.call(credentials)
      end
    end
  end
end
